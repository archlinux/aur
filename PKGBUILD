# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: James An <james@jamesan.ca>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=sejda-desktop
pkgver=5.3.1
pkgrel=1
license=('custom:EULA')
pkgdesc='PDF editor'
arch=('x86_64')
url='http://www.sejda.com/desktop'
source=("https://sejda-cdn.com/downloads/sejda-desktop_${pkgver}_amd64.deb")
sha512sums=('34a6382e7e8cf41fbc6dac0aef15912e4671eb4592591b9809c6473a4d8d137b6ba53b5b933e041e5125ba146b40bd68785d934a5aac4aca01a9e82595ba7336')
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
