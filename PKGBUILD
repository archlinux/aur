# Maintainer: Steven Seifried <gitlab@canox.net>
# Contributor: Steven Seifried <gitlab@canox.net>
pkgname=tuxedo-keyboard
pkgver=3.0.0
pkgrel=1
pkgdesc="Keyboard Backlight Driver from TUXEDO Computers"
url="https://github.com/tuxedocomputers/tuxedo-keyboard"
license=("GPL3")
arch=('x86_64') 
depends=('dkms')
optdepends=('linux-headers: build modules against Arch kernel'
            'linux-lts-headers: build modules against LTS kernel'
            'linux-zen-headers: build modules against ZEN kernel'
            'linux-hardened-headers: build modules against the HARDENED kernel')
provides=('tuxedo-keyboard' 'tuxedo-io')
conflicts=('tuxedo-cc-wmi')
replaces=('tuxedo-cc-wmi')
backup=(etc/modprobe.d/tuxedo_keyboard.conf)
source=($pkgname-$pkgver-tar.gz::https://github.com/tuxedocomputers/tuxedo-keyboard/archive/v${pkgver}.tar.gz tuxedokeyboard.conf)
sha256sums=('95bd38393d07329f1f944abcb20254a28f58b0f1551c63241396cc7fd4fc1972'
            'd22aadf76a400f38ddee7ce2fd7f8b14694bf1d402bfbb99e65133d122ccb0f8')
sha512sums=('1c6b2a0c086aaa6bd21795371d4747773608389be2d98d10d8e07499dfa63a628f639fa9ddfee4901e5c9d3b90c06116d1c537a8d7b6130612ea64fabcaedade'
            '8aef78240aacf4a5c15cfb648400750a17db3203d230d6a1f8a84b1db71f0bd0d65251690f6290d8707b771cf74c6f008b82c65b00220e8d3fa70153be65ade6')

package() {
  mkdir -p "${pkgdir}/usr/src/${pkgname}-${pkgver}"
  cp -r "${srcdir}/${pkgname}-${pkgver}"/* "${pkgdir}/usr/src/${pkgname}-${pkgver}"
  install -Dm644 tuxedokeyboard.conf "${pkgdir}/usr/lib/modprobe.d/tuxedokeyboard.conf"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}"/tuxedo_keyboard.conf "${pkgdir}/etc/modprobe.d/tuxedo_keyboard.conf"
}
