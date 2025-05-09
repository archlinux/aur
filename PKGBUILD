# Maintainer: xihale <xihale.top@qq.com>

pkgname="v2rayn-bin"
pkgver=7.12.1
pkgrel=1
pkgdesc="A GUI client for Windows and Linux, support Xray core and others"
arch=("x86_64" "arm64")
license=('GPL3')
url="https://github.com/2dust/v2rayN"
options=('!strip') # TODO: after striping, it cannot run

source_x86_64=(v2rayN-linux-64-${pkgver}-${pkgrel}.zip::"https://github.com/2dust/v2rayN/releases/download/${pkgver}/v2rayN-linux-64.zip")
sha256sums_x86_64=(3029c01d0db25687769ef69c244091915e1f2a22a5dc5d01a5425c488726b6f1)
source_arm64=(v2rayN-linux-arm64-${pkgver}-${pkgrel}.zip::"https://github.com/2dust/v2rayN/releases/download/${pkgver}/v2rayN-linux-arm64.zip")
sha256sums_arm64=(73424f4eca1b42e48582e0037ab768070d42fc61dcaee3e28f7c4c224f9043e5)

source+=("v2rayN.png" "v2rayN-bin.desktop")
sha256sums+=('f762fd95d93c2287f55ebb742716a54aa6b507ff8c8d75aec7256fabc93192ee'
  'c3193fc83a87c6a0c7bd10fbfc2cbbd568d33bc33be0b8e6b3773e6207a8b07d')

package() {

  _app_name=$pkgname

  install -Dm644 "${srcdir}/v2rayN.png" -t "${pkgdir}/usr/share/pixmaps"
  install -Dm644 "${srcdir}/v2rayN-bin.desktop" -t "${pkgdir}/usr/share/applications"
  mkdir -p "${pkgdir}/opt/$_app_name"
  find . -name "v2rayN-linux-*" -type d -exec sh -c 'mv "$1"/* "$2/opt/$3/"' _ {} $pkgdir $_app_name \;
  chmod -R 0777 ${pkgdir}/opt/$_app_name

}
