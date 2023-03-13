# Maintainer: xpt <user.xpt@gmail.com>
# Co-Maintainer: Serge K <arch@phnx47.net>

pkgname=prey-node-client
pkgver=1.11.1
pkgrel=2
pkgdesc="Node.js client for the Prey anti-theft software"
url="https://github.com/prey/prey-node-client"
arch=('x86_64')
license=('GPL3')
depends=('nodejs' 'mpg123' 'xawtv' 'scrot' 'openssh' 'wireless_tools' 'lsb-release' 'python' 'networkmanager' 'npm' 'gtk3' 'python-gobject')
provides=('prey-tracker')
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.zip::${url}/releases/download/v${pkgver}/prey-linux-${pkgver}-x64.zip"
        'prey-tracker'
        'disable-auto-updates.patch'
        'rename-bin.patch'
        'fix-lock.patch')
sha256sums=('55aa5b7bbe9abb303ec5da9d32c1bafeba91d07df9969a1ce0cac3e9f3a6b461'
            '41f29d334e7671b07cfdc848b2752ccc51710471285e8ebe61c07faa0d36160d'
            '37094af138edfa0fce31b43025a8b5e56e4a15715b4094e7ae9eea81f44c9e37'
            'c84e1a1fb5250ac0855f929110854a829269e1ad0a4b33f2779aa9d5f39bcf80'
            'd4df726fb87b652b352ca44ddb78afe0e16e40dc130753d86c2cbfa92ac2781d')

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
