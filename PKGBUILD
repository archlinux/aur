# Maintainer: xpt <user.xpt@gmail.com>
# Co-Maintainer: Serge K <arch@phnx47.net>

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
source=('prey-tracker' 'disable-auto-updates.patch' 'rename-bin.patch' 'fix-lock.patch')
source_x86_64=("https://downloads.preyproject.com/prey-client-releases/node-client/${pkgver}/prey-linux-${pkgver}-x64.zip")
source_i686=("https://downloads.preyproject.com/prey-client-releases/node-client/${pkgver}/prey-linux-${pkgver}-x86.zip")
sha256sums=('41f29d334e7671b07cfdc848b2752ccc51710471285e8ebe61c07faa0d36160d'
            '37094af138edfa0fce31b43025a8b5e56e4a15715b4094e7ae9eea81f44c9e37'
            'c84e1a1fb5250ac0855f929110854a829269e1ad0a4b33f2779aa9d5f39bcf80'
            'd4df726fb87b652b352ca44ddb78afe0e16e40dc130753d86c2cbfa92ac2781d')
sha256sums_x86_64=('e0991e83d46290dede40ee2134fda344b8690cf3e5a69df19394d95ae1aa50b6')
sha256sums_i686=('21416f91ccebcc1f44927231d2a00606e44113a861b79bd117c6172aa5ede803')

prepare() {
  cd "prey-${pkgver}"

  patch -p0 -i "${srcdir}/disable-auto-updates.patch"
  # Rename binary: prey -> prey-tracker
  patch -p0 -i "${srcdir}/rename-bin.patch"
  # Fix broken lock: https://github.com/prey/prey-node-client/issues/679
  patch -p0 -i "${srcdir}/fix-lock.patch"
}

package() {
  install -dm755 "${pkgdir}/usr/bin"
  cp "${srcdir}/prey-tracker" "${pkgdir}/usr/bin/prey-tracker"

  install -dm755 "${pkgdir}/opt/${pkgname}"
  cp -r "prey-${pkgver}/." "${pkgdir}/opt/prey-node-client"
}

# vim:set ts=2 sw=2 et:
