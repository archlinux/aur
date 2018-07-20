# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=sejda-desktop
pkgver=4.4.1
pkgrel=1
license=('custom:EULA')
pkgdesc='PDF editor'
arch=('x86_64')
url='http://www.sejda.com/desktop'
source=("https://bitbucket.org/sejdapdf/sejda-desktop-public/downloads/sejda-desktop_${pkgver}_amd64.deb")
sha512sums=('4b41c134e1b6dd04f046ee6de225aac2458ff4453fbea1c066a232c359c23d45b341266fbc41d04ddd34711dcd4d558585a0413bff64186118020a2d8941576b')
options=(!strip)

package() {
  bsdtar -xf data.tar.xz -C "${pkgdir}"
  install -d "${pkgdir}/usr/bin"
  ln -s /opt/sejda-desktop/sejda-desktop "${pkgdir}/usr/bin/sejda-desktop"

  # fix permissions
  find "${pkgdir}" -type d -exec chmod 755 {} \;

  # symlink licenses
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  for _i in EULA.pdf LICENSE.electron LICENSES.chromium.html; do
    ln -s /opt/sejda-desktop/${_i} "${pkgdir}/usr/share/licenses/${pkgname}/${_i}"
  done
}


