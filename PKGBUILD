# Maintainer: Keep-Silence<keep_silence_96@163.com>

_pkgname=wechat-callout
pkgname="${_pkgname}-git"
pkgver=r5.24cbaa4
pkgrel=1
pkgdesc="微信窗口快捷键唤出/隐藏（Wayland/KDE Plasma）"
arch=('any')
url="https://github.com/Keep-Silence/wechat-callout"
license=('MIT')
depends=('python' 'python-gobject')
makedepends=('git' 'gendesk')
source=("$pkgname::git+https://github.com/Keep-Silence/wechat-callout")
sha256sums=('SKIP')
install="${pkgname}.install"

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "$pkgname"

  gendesk -q -f -n \
      --pkgname "${pkgname}" \
      --pkgdesc "${pkgdesc}" \
      --name "微信显影" \
      --comment="${pkgdesc}" \
      --exec "/usr/share/${pkgname}/wechat-callout.py" \
      --categories 'Utility;' \
      --custom StartupWMClass="${pkgname}"
}

# Package installation
package() {
  cd "$pkgname"

  # Install the main executable and other files
  install -Dm755 wechat-callout.py -t "${pkgdir}/usr/share/${pkgname}"
  install -Dm644 "${_pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}
