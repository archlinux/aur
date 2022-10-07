# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgbase=samplebrain
pkgname=('samplebrain' 'samplebrain-docs')
pkgver=0.18.4
pkgrel=1
pkgdesc='Custom sample smashing app designed by Aphex Twin'
arch=('x86_64')
url='https://gitlab.com/then-try-this/samplebrain'
license=('GPL2')
makedepends=(
  'git'
  'hicolor-icon-theme'
  'libsndfile'
  'portaudio'
  'liblo'
  'fftw'
  'qt5-base'
)
_commit='ac83efce3b53c0ae6ca6723602d168b88b8ecb9e'
source=("$pkgbase::git+$url.git#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd "$pkgbase"

  git describe --tags | sed 's/_release//'
}

build() {
  cd "$pkgbase"

  qmake-qt5

  make
}

package_samplebrain() {
  depends=(
    'hicolor-icon-theme'
    'libsndfile'
    'portaudio'
    'liblo'
    'fftw'
    'qt5-base'
  )
  optdepends=('samplebrain-docs: documentation')

  cd "$pkgbase"

  make INSTALL_ROOT="$pkgdir" install
}

package_samplebrain-docs() {
  pkgdesc+=' (documentation)'

  cd "$pkgbase"

  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgbase" README.md
  cp -vr docs "$pkgdir/usr/share/doc/$pkgbase"
}
