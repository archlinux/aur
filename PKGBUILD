# Maintainer: insanengineer <insanengineer@gmail.com>
pkgname=touchpad-disabler
pkgver=0.3
pkgrel=1
pkgdesc="This application will disable a laptops touchpad when a usb is plugged in and display a notification to the user."
arch=('i686' 'x86_64')
url="https://github.com/insanengineer/touchpad-disabler"
license=('GPL2')
depends=('gtk3' 'libnotify' 'gconf>=2.18.0.1-4')
makedepends=('git')
source=('git+https://github.com/insanengineer/touchpad-disabler.git')
md5sums=('SKIP') 

pkgver() {
  cd "${pkgname}"
  git describe --tag | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname}"
  make
}

package() {
  cd "${pkgname}"

  install -d "${pkgdir}"/opt/"${pkgname}"

  install -Dm755 "${srcdir}/touchpad-disabler/bin/touchpad-disabler" "${pkgdir}/opt/touchpad-disabler" 

  desktop-file-install --dir="${pkgdir}/usr/share/applications" "${srcdir}/touchpad-disabler/touchpad-disabler.desktop"
}

post_install() {
  usr/sbin/gconfpkg --install "${pkgname}"
  update-desktop-database -q
}
