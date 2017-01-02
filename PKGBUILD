# Maintainer: Dmitri Goutnik <dg@syrec.org>

_pkgname=encryptpad
pkgname=${_pkgname}-git
pkgver=v0.3.2.3.r54.g37062a3
pkgrel=1
pkgdesc="Minimalist secure text editor and binary encryptor that implements RFC 4880 Open PGP format"
arch=(i686 x86_64)
url="https://github.com/evpo/${_pkgname}"
license=('GPL2')
depends=('qt5-base' 'hicolor-icon-theme')
conflicts=('encryptpad')
makedepends=('git' 'python')
source=("${_pkgname}::git+git://github.com/evpo/EncryptPad.git"
  'encryptpad.patch')
options=('!makeflags')
sha1sums=('SKIP'
  'fc181153279e6c1167b506a50b4c685475f08bc3')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}
 
prepare() {
  cd "${srcdir}/${_pkgname}"
  patch -Np1 -i ../encryptpad.patch
}

build() {
  cd "$srcdir/${_pkgname}"
  ./configure.sh --all
}

package() {
  cd "$srcdir/${_pkgname}"
  mkdir -p ${pkgdir}/usr/bin
  install -Dm755 bin/release/encryptcli bin/release/encryptpad ${pkgdir}/usr/bin/
  install -Dm644 ${_pkgname}.desktop ${pkgdir}/usr/share/applications/${_pkgname}.desktop
  install -Dm644 ${_pkgname}.xml ${pkgdir}/usr/share/mime/application/${_pkgname}.xml
  install -Dm644 images/icns.iconset/icon_16x16.png $pkgdir/usr/share/icons/hicolor/16x16/apps/${_pkgname}.png
  install -Dm644 images/icns.iconset/icon_32x32.png $pkgdir/usr/share/icons/hicolor/32x32/apps/${_pkgname}.png
  install -Dm644 images/icns.iconset/icon_128x128.png $pkgdir/usr/share/icons/hicolor/128x128/apps/${_pkgname}.png
  install -Dm644 images/icns.iconset/icon_256x256.png $pkgdir/usr/share/icons/hicolor/256x256/apps/${_pkgname}.png
}

# vim:set ts=2 sts=2 sw=2 et:
