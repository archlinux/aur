# Maintainer: insanengineer <insanengineer@gmail.com>
pkgname=touchpad-disabler
pkgver=0.4
pkgrel=1
pkgdesc="This application will disable a laptops touchpad when a usb is plugged in and display a notification to the user."
arch=('i686' 'x86_64')
url="https://github.com/insanengineer/touchpad-disabler"
license=('GPL2')
depends=('gtk3' 'libnotify' 'gconf>=2.18.0.1-4')
makedepends=('git')
source=('git+https://github.com/insanengineer/touchpad-disabler.git')
md5sums=('SKIP') 
install="${pkgname}.install"

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --tag | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${pkgname}"
  make
}

package() {
  cd "${srcdir}/${pkgname}"

  install -Dm755 "bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  install -Dm644 "schemas/apps.${pkgname}.gschema.xml" "${pkgdir}/usr/share/glib-2.0/schemas/apps.${pkgname}.gschema.xml"

  desktop-file-install --dir="${pkgdir}/usr/share/applications" "${pkgname}.desktop"
}
