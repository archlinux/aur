# Maintainer: Benjamin Denhartog <ben@sudoforge.com>

# This PKGBUILD is managed at https://github.com/sudoforge/pkgbuilds

pkgname=wee-slack-git
pkgver=2.2.0.r1.g8d778b7
pkgrel=1
pkgdesc="A WeeChat plugin for slack"
arch=('any')
url="https://github.com/wee-slack/${pkgname%-git}"
license=('MIT')
depends=(
  'python2-websocket-client'
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

  msg2 "Installing license"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"

  msg2 "Since WeeChat does not yet load plugins in the system path, you need to"
  msg2 "load the script and emoji dictionary from your user path. Use symlnks"
  msg2 "so that you can benefit from package upgrades via pacman."
  msg2 "    $ ln -s /usr/lib/weechat/python/wee_slack.py $HOME/.weechat/python/wee_slack.py"
  msg2 "    $ ln -s /usr/lib/weechat/weemoji.json $HOME/.weechat/weemoji.json"
}
