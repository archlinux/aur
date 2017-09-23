# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=sejda-desktop
pkgver=3.0.8
pkgrel=1
license=('custom:EULA')
pkgdesc='PDF editor'
arch=('x86_64')
url='http://www.sejda.com/desktop'
source=("https://bitbucket.org/sejdapdf/sejda-desktop-public/downloads/sejda-desktop_${pkgver}_amd64.deb")
sha512sums=('9ba0849f85f217a31de58f00113a16ecdea91ddd9e9315f0dd9a501099e5abc0a57a480782414c454c6646bfae7096bc1f44494adb57c83ab31fe3af6f2c66b7')
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

