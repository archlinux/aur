# Maintainer: xpt <user.xpt@gmail.com>
# Contributor: Serge K <arch@phnx47.net>

pkgname=prey-node-client
pkgver=1.10.11
pkgrel=2
pkgdesc="Remote tracking and monitoring application for laptops, smartphones, and other electronic devices"
url="https://preyproject.com/"
arch=('x86_64' 'i686')
license=('GPL3')
depends=('nodejs' 'mpg123' 'xawtv' 'scrot' 'openssh' 'wireless_tools' 'lsb-release' 'python' 'networkmanager' 'npm' 'gtk3' 'python-gobject')
provides=('prey-tracker')
install="${pkgname}.install"
source=('prey-tracker' 'fix-symlink-path-and-disable-auto-updates.patch' 'fix-lock.patch')
source_x86_64=("https://downloads.preyproject.com/prey-client-releases/node-client/${pkgver}/prey-linux-${pkgver}-x64.zip")
source_i686=("https://downloads.preyproject.com/prey-client-releases/node-client/${pkgver}/prey-linux-${pkgver}-x86.zip")
sha256sums=('41f29d334e7671b07cfdc848b2752ccc51710471285e8ebe61c07faa0d36160d'
            '0ec04bab461633885aa30ec673322e80c582b2478aab376f938a42fa75500707'
            'd4df726fb87b652b352ca44ddb78afe0e16e40dc130753d86c2cbfa92ac2781d')
sha256sums_x86_64=('e0991e83d46290dede40ee2134fda344b8690cf3e5a69df19394d95ae1aa50b6')
sha256sums_i686=('21416f91ccebcc1f44927231d2a00606e44113a861b79bd117c6172aa5ede803')

package() {
  cd "${srcdir}/prey-${pkgver}"

  # Fix symlink path, and default-disable automatic updates
  patch -p0 -i ${srcdir}/fix-symlink-path-and-disable-auto-updates.patch
  # Fix broken lock
  patch -p0 -i ${srcdir}/fix-lock.patch

  install -dm755 "${pkgdir}/opt/${pkgname}"
  cp -r ./* "${pkgdir}/opt/prey-node-client/"

  install -d ${pkgdir}/usr/share/licenses/${pkgname}
  ln -s "/opt/${pkgname}/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"

  install -dm755 "${pkgdir}/usr/bin/"

  # Binary prey named as prey-tracker
  cp "${srcdir}/prey-tracker" "${pkgdir}/usr/bin/prey-tracker"
}

# vim:set ts=2 sw=2 et:
