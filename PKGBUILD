# Maintainer: H3CoF6 <h3cof6@gmail.com>
pkgname=weflow
pkgver=4.1.2
pkgrel=2
pkgdesc="A local WeChat database decryption and analysis tool"
arch=('x86_64')
url="https://github.com/hicccc77/weflow"
license=('CC-BY-NC-SA-4.0')
depends=('alsa-lib' 'gtk3' 'nss' 'glibc')
options=('!strip' '!debug')

source=("WeFlow-${pkgver}-Setup.tar.gz::${url}/releases/download/v${pkgver}/WeFlow-${pkgver}-Setup.tar.gz"
  "weflow.desktop"
  "icon.png")

noextract=("WeFlow-${pkgver}-Setup.tar.gz")
sha256sums=('a3ab489cf94695927adc1b62f5054247c632ebc658e5a1f6ee9ac0f97f049703'
  '2cf03766f5c2f1915ad136f060a66f5788ed32b06defe1956e406c73d7e733b7'
  'b1c412d9c08ae683e231173c16fe73958ad1063f14c9b3852373385e4fcb6f33')

prepare() {
  mkdir -p "${srcdir}/weflow-app"
  bsdtar -xf "${srcdir}/WeFlow-${pkgver}-Setup.tar.gz" -C "${srcdir}/weflow-app"
}

package() {
  install -dm755 "${pkgdir}/opt/${pkgname}"
  cp -a "${srcdir}/weflow-app/"* "${pkgdir}/opt/${pkgname}/"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/weflow" "${pkgdir}/usr/bin/${pkgname}"

  install -Dm644 "${srcdir}/weflow.desktop" -t "${pkgdir}/usr/share/applications/"
  install -Dm644 "${srcdir}/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
