# Maintainer: soloturn@gmail.com
# Contributor: nblock <nblock [/at\] archlinux DOT us>

_basename=qrk
pkgname="$_basename-git"
pkgver=1.10.3
pkgrel=0
pkgdesc="A graphical cash register for small companies"
arch=('i686' 'x86_64')
url="https://www.ckvsoft.at"
license=('GPL')
depends=('crypto++' 'qrencode' 'pcsclite')
makedepends=('git' 'qt5-declarative')
conflicts=("$_basename")
provides=("$_basename")

source=("$pkgname::git://git.code.sf.net/p/qrk-registrier-kasse/code")
sha1sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname}"
  _upper_basename=$(echo ${_basename} | tr '[:lower:]' '[:upper:]')
  qmake-qt5 "${_upper_basename}.pro"
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  mkdir -p ${pkgdir}/usr/{bin,lib,share/applications}
  install -D -m755 "bin/$_basename" "$pkgdir"/usr/bin/$_basename
  cp qrkcore/libQrkCore.so* "$pkgdir"/usr/lib/
  install -D -m644 "src/icons/logo.png" "$pkgdir/usr/share/pixmaps/$_basename.png"
  # no idea who produces qrk.desktop
  # install -D -m644 "$srcdir/$_basename.desktop" "$pkgdir/usr/share/applications/$_basename.desktop"
}

