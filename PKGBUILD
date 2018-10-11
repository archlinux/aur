# Maintainer: Benjamin Denhartog <ben@sudoforge.com>

# This PKGBUILD is managed at https://github.com/sudoforge/pkgbuilds

pkgname=wee-slack-git
pkgver=2.1.1.r22.fab34dc
pkgrel=1
pkgdesc="Store work-in-progress commits on the remote without cluttering the commit history"
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
source=("git+${url}.git")
sha256sums=('SKIP')

package() {
  cd "${srcdir}/${pkgname%-git}"

  msg2 "Installing the wee-slack plugin"
  install -Dm644 wee_slack.py "${pkgdir}/usr/lib/weechat/python/wee_slack.py"

  msg2 "Installing the emoji tab completion dictionary"
  install -Dm644 weemoji.json "${pkgdir}/usr/lib/weechat/weemoji.json"
  msg2 "To enable emoji tab completion, run the following command in weechat:"
  msg2 '    /set weechat.completion.default_template "%%(nicks)|%%(irc_channels)|%%(emoji)"'
}
