# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: James An <james@jamesan.ca>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=sejda-desktop
pkgver=5.3.5
pkgrel=1
license=('custom:EULA')
pkgdesc='PDF editor'
arch=('x86_64')
url='http://www.sejda.com/desktop'
source=("https://sejda-cdn.com/downloads/sejda-desktop_${pkgver}_amd64.deb")
sha512sums=('050203d439a745bc86b1723f343f2104d09f6d152d038c9aeb9854fda76ad13b4bf9b7040207bdf98ebdf1e64872148c0386ce78eb6ff67edf151ebbf3f547c3')
options=(!strip)

package() {
  bsdtar -xf data.tar.gz -C "${pkgdir}"
  install -d "${pkgdir}/usr/bin"
  ln -s "${pkgdir}/opt/sejda-desktop/sejda-desktop" "${pkgdir}/usr/bin/sejda-desktop"

  # fix permissions
  find "${pkgdir}" -type d -exec chmod 755 {} \;
  find "${pkgdir}" -type f -exec chmod 644 {} \;
  chmod 755 "${pkgdir}"/opt/sejda-desktop/resources/vendor/desktop-launcher/bin/desktop-launcher
  chmod 755 "${pkgdir}"/opt/sejda-desktop/resources/vendor/java/bin/java
  chmod 755 "${pkgdir}"/opt/sejda-desktop/sejda-desktop
  chmod 755 "${pkgdir}"/usr/bin/sejda-desktop

  # symlink licenses
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  for _i in EULA.pdf LICENSE.electron LICENSES.chromium.html; do
    ln -s /opt/sejda-desktop/${_i} "${pkgdir}/usr/share/licenses/${pkgname}/${_i}"
  done
}
