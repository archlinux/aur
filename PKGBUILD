# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=sejda-desktop
pkgver=2.5.10
pkgrel=1
license=('custom:EULA')
pkgdesc='PDF editor'
arch=('x86_64')
url='http://www.sejda.com/desktop'
source=("https://bitbucket.org/sejdapdf/sejda-desktop-public/downloads/sejda-desktop_${pkgver}_amd64.deb")
sha512sums=('5129c16badb1abec4ffc8077af1f1a0912957618d9c5af9b59425632afa2fb2866a1df680444066d77c90bd6b8aae77a59b727294f1559148314c182cedd022f')
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
