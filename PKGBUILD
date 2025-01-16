# Maintainer: 
# Contributor: xpt <user.xpt@gmail.com>
# Contributor: Serge K <arch@phnx47.net>

pkgname=prey-node-client
pkgver=1.13.8
pkgrel=1
pkgdesc="Node.js client for the Prey anti-theft software"
url="https://github.com/prey/prey-node-client"
arch=('x86_64')
license=('GPL-3.0-or-later')
depends=('nodejs>=20.16.0' 'mpg123' 'xawtv' 'scrot' 'openssh' 'wireless_tools' 'lsb-release' 'python' 'networkmanager' 'npm' 'gtk3' 'python-gobject')
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.zip::${url}/releases/download/v${pkgver}/prey-linux-${pkgver}-x64.zip"
        'prey-tracker.sh'
        'disable-auto-updates.patch')
sha256sums=('710bb38af8e7909928c32ead90748c92474bd5e5128ccdaba8184f7b3fa12212'
            'f2e837b40bea3a4e24ada3a9ef385f0db71e9c0aa9e463f9c63619563bd27ef3'
            '58ceec470e1da9c945abfeeb36e421e1cf9ec1a74002349bb1652849d361206b')

prepare() {
  cd "prey-${pkgver}"

  patch -p0 -i "${srcdir}/disable-auto-updates.patch"
}

package() {
  install -dm755 "${pkgdir}/usr/bin"
  cp "${srcdir}/prey-tracker.sh" "${pkgdir}/usr/bin/prey-tracker"

  install -dm755 "${pkgdir}/opt/${pkgname}"
  cp -r "prey-${pkgver}/." "${pkgdir}/opt/prey-node-client"
}

# vim:set ts=2 sw=2 et:
