# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Co-Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=adbmanager-bin
pkgver=3.1
pkgrel=2
pkgdesc="ADB manager for Android devices"
arch=('x86_64')
url="https://github.com/AKotov-dev/adbmanager"
license=('GPL3')
depends=('android-tools' 'gtk2' 'iproute2' 'nmap' 'sakura')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}-0.mrx8_amd64.deb")
sha512sums=('c3dbd4dac2cdfac9a6f6082b9395968f101bfbad3e881b0ff14f45d00558e08b00528964dad09c1ff68f53b01dfcbf9f4ca517958c12b3946b2ccb7c9e7e60f1')

prepare() {
  mkdir -p "${pkgname%-bin}-$pkgver"
  bsdtar -xvf data.tar.xz -C "${pkgname%-bin}-$pkgver"
}

package() {
  cd "${pkgname%-bin}-$pkgver"
  install -Dm755 "usr/share/${pkgname%-bin}/${pkgname%-bin}" -t "${pkgdir}/usr/bin/"
  install -Dm644 "usr/share/applications/${pkgname%-bin}.desktop" -t \
    "$pkgdir/usr/share/applications/"
  install -Dm644 "usr/share/${pkgname%-bin}/ico/${pkgname%-bin}.png" -t \
   "$pkgdir/usr/share/pixmaps/"
}
