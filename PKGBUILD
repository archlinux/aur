# Maintainer: Benjamin Denhartog <ben@sudoforge.com>

# For ISSUES, REQUESTS, and QUESTIONS:
# https://github.com/sudoforge/pkgbuilds

pkgname=wee-slack-git
pkgver=2.9.0
pkgrel=1
pkgdesc="A WeeChat plugin for slack"
arch=('any')
url="https://github.com/wee-slack/${pkgname%-git}"
license=('MIT')
depends=(
  'python-websocket-client'
  'weechat'
)
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install=$pkgname.install
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${srcdir}/${pkgname%-git}"

  # Install the plugin script
  install -Dm644 wee_slack.py "${pkgdir}/usr/share/weechat/python/wee_slack.py"

  # Install the emoji tab completion dictionary
  install -Dm644 weemoji.json "${pkgdir}/usr/share/weechat/weemoji.json"

  # Install the plugin license
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"
}
