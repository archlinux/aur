# Maintainer: xihale <xihale.top@qq.com>

pkgname="v2rayn-bin"
pkgver=7.13.2
pkgrel=1
pkgdesc="A GUI client for Windows and Linux, support Xray core and others"
arch=("x86_64" "arm64")
license=('GPL3')
url="https://github.com/2dust/v2rayN"
options=('!strip') # TODO: after striping, it cannot run

source_x86_64=(v2rayN-linux-64-${pkgver}-${pkgrel}.zip::"https://github.com/2dust/v2rayN/releases/download/${pkgver}/v2rayN-linux-64.zip")
sha256sums_x86_64=(27da1235c4a61c0540402eda8e1c540f7a06f5a1acfe6b67d353f51ec8ab0f01)
source_arm64=(v2rayN-linux-arm64-${pkgver}-${pkgrel}.zip::"https://github.com/2dust/v2rayN/releases/download/${pkgver}/v2rayN-linux-arm64.zip")
sha256sums_arm64=(c72507b23b10a291cc73db6b060fef4b411ee5431026d5d07f8d9ff5b94787be)

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
