# Maintainer: Swift Geek <swiftgeek+aur@gmail.com>
# Co-Maintainer: Benjamin Denhartog <ben@sudoforge.com>

# POST-INSTALLATION INSTRUCTIONS
#
# WeeChat is unable to source files from outside of a user's home directory.
# Because of this limitation, this package *DOES NOT* make the Slack plugin
# available to WeeChat without end user interaction.
#
# Each user who wants to enable the Slack plugin needs to create symlinks in
# the WeeChat configuration directory for their user (by default, ~/.weechat).
# The following commands will accomplish this:
#
#     $ ln -s /usr/lib/weechat/weemoji.json ~/.weechat/weemoji.json
#     $ ln -s /usr/lib/weechat/python/wee_slack.py ~/.weechat/python/autoload/wee_slack.py

pkgname=wee-slack
pkgver=2.3.0
pkgrel=4
pkgdesc='A WeeChat plugin for Slack.com'
url='https://github.com/wee-slack/wee-slack/'
arch=('any')
license=('MIT')
depends=('weechat' 'python-websocket-client')
conflicts=('wee-slack-git')
source=("${pkgname}_${pkgver}.tar.gz::https://github.com/wee-slack/wee-slack/archive/v${pkgver}.tar.gz")
sha512sums=(
  '69e9beab24e46e2ab4ce8153a44a34ebd89195c4ad1ac7c5daa7b06711f2d11145e62e957127ff77e096709a0fa6de7772ad5af7d140c04fe7c3dff2102dc04b'
)

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 "Installing the wee-slack plugin"
  install -Dm644 wee_slack.py "${pkgdir}/usr/lib/weechat/python/wee_slack.py"

  msg2 "Installing the emoji tab completion dictionary"
  install -Dm644 weemoji.json "${pkgdir}/usr/lib/weechat/weemoji.json"

  msg2 "Installing license"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
