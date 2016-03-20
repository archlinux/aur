# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Giuliano Schneider <gs93@gmx.net>
# Contributor: [Vitaliy Berdinskikh](mailto:ur6lad@archlinux.org.ua) aka UR6LAD

_eclipse_name=mars
_eclipse_release=2
pkgname=eclipse-jee
pkgver=4.5.2
pkgrel=1
pkgdesc="Eclipse IDE for Java EE Developers"
arch=('i686' 'x86_64')
url="http://www.eclipse.org"
license=('EPL')
depends=('java-environment' 'gtk2' 'webkitgtk2')
install="${pkgname}.install"
source=("${pkgname}.sh"
        "${pkgname}.desktop"
        "${pkgname}.ini.patch"
        "${pkgname}.svg")
source_i686=("${pkgname}-${_eclipse_name}-${_eclipse_release}-linux-gtk.tar.gz"::"http://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/${_eclipse_name}/${_eclipse_release}/${pkgname}-${_eclipse_name}-${_eclipse_release}-linux-gtk.tar.gz&r=1")
source_x86_64=("${pkgname}-${_eclipse_name}-${_eclipse_release}-linux-gtk-${CARCH}.tar.gz"::"http://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/${_eclipse_name}/${_eclipse_release}/${pkgname}-${_eclipse_name}-${_eclipse_release}-linux-gtk-${CARCH}.tar.gz&r=1")
sha256sums=('d20cff0ecbcdd2d180b02d646293e5adbad926fd7183f49cc8f4f5789899db38'
            '462c1b703a35e99995dd8531d184dce7a723389bd89e4e721b5708b0e8e438bf'
            '854557110c6ea3b7c79fb92dc070ac39fc4c897385601c11779cd62ce6e00a03'
            'da103fe3b9d8c6cc1316b2b45347697bf6561230e81286b78cf142b64b1d89a5')
sha256sums_i686=('1d3f5cf7da41f549e94777367417a3b1cfcd749ab054f9ae92cf252c7e5ebbef')
sha256sums_x86_64=('5155460d2b279ddcbf791b4286f289de7b3b938ebf46947e6e87258dc748e23a')
# prevent package compression
PKGEXT=".pkg.tar"

build() {
  patch -p0 -i "${pkgname}.ini.patch"
}

package() {
  # Copy application files
  install -m 755 -d "${pkgdir}/usr/lib"
  cp -a "eclipse" "${pkgdir}/usr/lib/${pkgname}"

  # Copy executable file
  install -m 755 -d "${pkgdir}/usr/bin"
  install -m 755 "${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

  # Copy icons
  install -m 755 -d "${pkgdir}/usr/share/icons"
  for _size in 16 32 48 256
  do
    install -m 755 -d "${pkgdir}/usr/share/icons/hicolor/${_size}x${_size}/apps"
    install -m 644 eclipse/plugins/org.eclipse.platform_4.*.v*/eclipse${_size}.png \
      "${pkgdir}/usr/share/icons/hicolor/${_size}x${_size}/apps/${pkgname}.png"
  done
  install -m 755 -d "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
  install -m 644 "${pkgname}.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"

  # Copy desktop file
  install -m 755 -d "${pkgdir}/usr/share/applications"
  install -m 755 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
