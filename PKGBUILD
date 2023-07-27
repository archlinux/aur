# Maintainer: xpt <user.xpt@gmail.com>
# Maintainer: Serge K <arch@phnx47.net>

pkgname=prey-node-client
pkgver=1.11.6
pkgrel=1
pkgdesc="Node.js client for the Prey anti-theft software"
url="https://github.com/prey/prey-node-client"
arch=('x86_64')
license=('GPL3')
depends=('nodejs>=16.18.0' 'mpg123' 'xawtv' 'scrot' 'openssh' 'wireless_tools' 'lsb-release' 'python' 'networkmanager' 'npm' 'gtk3' 'python-gobject')
provides=('prey-tracker')
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.zip::${url}/releases/download/v${pkgver}/prey-linux-${pkgver}-x64.zip"
        'prey-tracker.sh'
        'disable-auto-updates.patch'
        'fix-lock.patch')
sha256sums=('80afe8b13da225ca65f5b724400e047479b7ffa8280ba6ee77fddbf554fc24e2'
            'f2e837b40bea3a4e24ada3a9ef385f0db71e9c0aa9e463f9c63619563bd27ef3'
            '37094af138edfa0fce31b43025a8b5e56e4a15715b4094e7ae9eea81f44c9e37'
            'd4df726fb87b652b352ca44ddb78afe0e16e40dc130753d86c2cbfa92ac2781d')

prepare() {
  cd "prey-${pkgver}"

  patch -p0 -i "${srcdir}/disable-auto-updates.patch"
  # Fix broken lock: https://github.com/prey/prey-node-client/issues/679
  patch -p0 -i "${srcdir}/fix-lock.patch"
}

package() {
  install -dm755 "${pkgdir}/usr/bin"
  cp "${srcdir}/prey-tracker.sh" "${pkgdir}/usr/bin/prey-tracker"

  install -dm755 "${pkgdir}/opt/${pkgname}"
  cp -r "prey-${pkgver}/." "${pkgdir}/opt/prey-node-client"
}

# vim:set ts=2 sw=2 et:
