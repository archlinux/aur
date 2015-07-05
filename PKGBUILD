# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Giuliano Schneider <gs93@gmx.net>
# Contributor: [Vitaliy Berdinskikh](mailto:ur6lad@archlinux.org.ua) aka UR6LAD

_eclipse_name=mars
_eclipse_release=R
pkgname=eclipse-jee
pkgver=4.5.0
pkgrel=1
pkgdesc="Eclipse IDE for Java EE Developers"
arch=('i686' 'x86_64')
url="http://www.eclipse.org"
license=('EPL')
depends=('java-environment>=6' 'gtk2' 'webkitgtk2')
provides=("eclipse=${pkgver}")
conflicts=('eclipse')
install="${pkgname}.install"
source=("eclipse.sh"
        "eclipse.desktop"
        "eclipse.ini.patch"
        "eclipse.svg")
source_i686=("${pkgname}-${_eclipse_name}-${_eclipse_release}-linux-gtk.tar.gz"::"http://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/${_eclipse_name}/${_eclipse_release}/${pkgname}-${_eclipse_name}-${_eclipse_release}-linux-gtk.tar.gz&r=1")
source_x86_64=("${pkgname}-${_eclipse_name}-${_eclipse_release}-linux-gtk-${CARCH}.tar.gz"::"http://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/${_eclipse_name}/${_eclipse_release}/${pkgname}-${_eclipse_name}-${_eclipse_release}-linux-gtk-${CARCH}.tar.gz&r=1")
sha256sums=('9fdf02d827e5f3b44146a0532c463ef44d0bf3aa57d0be4f2acccc38a170915b'
            '4eb2189c96fcfa340886b049b34dc3636d7b2bfa865140dc72edb61455d900c3'
            'efe21d1774a8f8233c73e7aa5e19a93dcfba44ebaba64b63d774a2d373c0d4a1'
            'da103fe3b9d8c6cc1316b2b45347697bf6561230e81286b78cf142b64b1d89a5')
sha256sums_i686=('33b1de6fc8d0207a7120fba799c45fc4b1308dc41729a73c2b512c2a12128bd2')
sha256sums_x86_64=('84468e35cf67ee55fbf411d316d0685a691d440ac30fc7b154d9a087852ff126')
# prevent package compression
PKGEXT=".pkg.tar"

build() {
  patch -p0 -i "eclipse.ini.patch"
}

package() {
  # Copy application files
  install -m 755 -d "${pkgdir}/usr/share"
  cp -a "eclipse" "${pkgdir}/usr/share"

  # Copy executable file
  install -m 755 -d "${pkgdir}/usr/bin"
  install -m 755 eclipse.sh "${pkgdir}/usr/bin/eclipse"

  # Copy icons
  install -m 755 -d "${pkgdir}/usr/share/icons"
  for _size in 16 32 48 256
  do
    install -m 755 -d "${pkgdir}/usr/share/icons/hicolor/${_size}x${_size}/apps"
    install -m 644 eclipse/plugins/org.eclipse.platform_4.*.v*/eclipse${_size}.png \
      "${pkgdir}/usr/share/icons/hicolor/${_size}x${_size}/apps/eclipse.png"
  done
  install -m 755 -d "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
  install -m 644 "eclipse.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/eclipse.svg"

  # Copy desktop file
  install -m 755 -d "${pkgdir}/usr/share/applications"
  install -m 755 "eclipse.desktop" "${pkgdir}/usr/share/applications/eclipse.desktop"
}
