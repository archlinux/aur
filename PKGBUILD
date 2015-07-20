# Maintainer: Cyker Way <cykerway at gmail dot com>

pkgname=pianobarfly-git
pkgver=20140330
pkgrel=1
pkgdesc="A console client for the personalized web radio pandora"
arch=(any)
url="https://github.com/nega0/pianobarfly"
license=(custom)
depends=('libao' 'ffmpeg' 'readline' 'json-c' 'libgcrypt' 'gnutls' 'faad2')
optdepends=('libmad')
makedepends=('pkgconfig>=0.9' 'git' 'automake')
provides=('pianobarfly')
conflicts=('pianobarfly')
source=(
  "${pkgname}::git://github.com/nega0/pianobarfly.git"
  Makefile.patch
)
sha256sums=(
  'SKIP'
  '0478dd2ded42ce03841213259115dabb87a667882ba390260a67a95fc9339eda'
)

pkgver() {
  cd "$srcdir/$pkgname"
  git show --pretty=format:%ci HEAD | cut -d ' ' -f 1 | sed 's/-//g'
}

prepare() {
  cd "$srcdir/$pkgname"
  patch -p0 < ../Makefile.patch
}

build() {
  cd "$srcdir/$pkgname"
  make
}

check() {
  cd "$srcdir/$pkgname"
}

package() {
  cd "$srcdir/$pkgname"

  make DESTDIR="$pkgdir" PREFIX=/usr install

  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/"
}
