# Maintainer: Dmitri Goutnik <dg@syrec.org>

_pkgname=encryptpad
pkgname=${_pkgname}-git
pkgver=v0.3.2.2.r11.gfa39929
pkgrel=1
pkgdesc="Minimalist secure text editor and binary encryptor that implements RFC 4880 Open PGP format"
arch=(i686 x86_64)
url="https://github.com/evpo/${_pkgname}"
license=('GPL2')
depends=('qt5-base' 'hicolor-icon-theme')
makedepends=('git' 'python2' 'qt5-tools' 'gendesk')
options=('!makeflags')
source=("${_pkgname}::git+git://github.com/evpo/EncryptPad.git"
  "encryptpad.patch")
sha1sums=('SKIP'
  'fc181153279e6c1167b506a50b4c685475f08bc3')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}
 
prepare() {
  cd "${srcdir}/${_pkgname}"
  patch -Np1 -i ../encryptpad.patch
  gendesk --pkgname "${_pkgname}" --pkgdesc "${pkgdesc}" --categories "Utility;TextEditor" --exec EncryptPad
}

build() {
  cd "$srcdir/${_pkgname}"
  ./configure.sh --all
}

package() {
  cd "$srcdir/${_pkgname}"
  mkdir -p ${pkgdir}/usr/bin
  install -Dm755 bin/release/encryptcli bin/release/EncryptPad ${pkgdir}/usr/bin/
  install -Dm644 ${_pkgname}.desktop ${pkgdir}/usr/share/applications/${_pkgname}.desktop
  install -Dm644 images/icns.iconset/icon_16x16.png $pkgdir/usr/share/icons/hicolor/16x16/${_pkgname}.png
  install -Dm644 images/icns.iconset/icon_32x32.png $pkgdir/usr/share/icons/hicolor/32x32/${_pkgname}.png
  install -Dm644 images/icns.iconset/icon_128x128.png $pkgdir/usr/share/icons/hicolor/128x128/${_pkgname}.png
}

# vim:set ts=2 sts=2 sw=2 et:
