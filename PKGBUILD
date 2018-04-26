# Maintainer:  Lamelos <lamelos plus aur at gmail dot com>

pkgname=electra-desktop-bin
_pkgname=electra-desktop
pkgver=1.0.8
pkgrel=1
pkgdesc='Cross-platform Desktop Wallet for Electra blockchain.'
arch=('x86_64')
url='https://electraproject.org/'
license=('MIT')
depends=('gconf' 'gtk2' 'libxtst' 'nss' 'libxss')
optdepends=('alsa-lib: sound support')
makedepends=('binutils' 'xz')
_srcfile="${_pkgname}_${pkgver}_amd64.deb"
noextract=("${_srcfile}")
source=("https://github.com/Electra-project/electra-desktop/releases/download/v${pkgver}/${_srcfile}")
sha256sums=('a93b484da725d5d828d1b3a1824b26637396313038b134b376c4b04d61acd06b')

prepare() {
  cd "$srcdir"
  ar p "${_srcfile}" data.tar.xz | tar Jx
}

package() {
  cd "$srcdir"

  # Copy deb contents to package
  mkdir "$pkgdir/opt"
  cp -R "opt/Electra Desktop/" "$pkgdir/opt/${_pkgname}"

  # Create symlink to binary
  mkdir -p "$pkgdir/usr/bin"
  ln -sf "/opt/${_pkgname}/electra-desktop" "$pkgdir/usr/bin/electra-desktop"
}
