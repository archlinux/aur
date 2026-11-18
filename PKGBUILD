# Maintainer: lucas007 <lucaszhou007@163.com>

pkgname=garage-webui
pkgver=1.1.0
pkgrel=1
pkgdesc="Garage去中心化的存储服务的前端UI界面。"
url="https://github.com/khairul169/garage-webui"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
license=('MIT')
conflicts=('garage-webui-bin')
provides=('garage-webui')
depends=('garage')

source_x86_64=("https://github.com/khairul169/garage-webui/releases/download/${pkgver}/garage-webui-v${pkgver}-linux-amd64")
source_i686=("https://github.com/khairul169/garage-webui/releases/download/${pkgver}/garage-webui-v${pkgver}-linux-386")
source_aarch64=("https://github.com/khairul169/garage-webui/releases/download/${pkgver}/garage-webui-v${pkgver}-linux-arm64")
source_armv7h=("https://github.com/khairul169/garage-webui/releases/download/${pkgver}/garage-webui-v${pkgver}-linux-arm")

sha256sums=('5e5b86f12a7e58dce8af34e5a631bc0b822910f030234aa463424441841e7c39')
sha256sums_x86_64=('180b5946957928f6cef1683c484a69d3b6c4f0ec00e132402863fc8ff824e746')
sha256sums_i686=('46c9e0fd8b505ec29f24b38ce720e1835b3bfe2856ade96d0618d070b38e1c65')
sha256sums_aarch64=('89c2f4502c00e8edc207612234d0ddcd96147155165b5c662dd2c71849adf42f')
sha256sums_armv7h=('a2ff7a39893d1f40410ccb9594d543a39f3e95e25911cde81d4356c0de9d4206')

source=("${pkgname}.service")

package() {
    # 安装二进制文件
    case "$CARCH" in
        x86_64)  _goarch=amd64 ;;
        i686)    _goarch=386 ;;
        aarch64) _goarch=arm64 ;;
        armv7h)  _goarch=arm ;;
    esac
    install -Dm755 "${srcdir}/garage-webui-v${pkgver}-linux-${_goarch}" "${pkgdir}/usr/bin/${pkgname}"
    # 安装服务文件
    install -Dm644 "${srcdir}/${pkgname}.service" "${pkgdir}/etc/systemd/system/${pkgname}.service"
}
