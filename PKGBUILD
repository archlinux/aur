# Maintainer: Swift Geek <swiftgeek+aur@gmail.com>
# Co-Maintainer: Benjamin Denhartog <ben@sudoforge.com>

# POST-INSTALLATION INSTRUCTIONS
#
# WeeChat is unable to source files from outside of a user's home directory.
# Because of this limitation, this package *DOES NOT* make this plugin available
# to WeeChat without end user interaction.
#
# Each user who wants to enable this plugin needs to create symlinks in the
# WeeChat configuration directory for their user (by default, ~/.weechat). The
# following command(s) will accomplish this:
#
#     $ ln -s /usr/lib/weechat/weemoji.json ~/.weechat/weemoji.json
#     $ ln -s /usr/lib/weechat/python/wee_slack.py ~/.weechat/python/autoload/wee_slack.py

pkgname=wee-slack
pkgver=2.4.0
pkgrel=2
pkgdesc='A WeeChat plugin for Slack.com'
url='https://github.com/wee-slack/wee-slack/'
arch=('any')
license=('MIT')
depends=('weechat' 'python-websocket-client')
conflicts=('wee-slack-git')
source=("${pkgname}_${pkgver}.tar.gz::https://github.com/wee-slack/wee-slack/archive/v${pkgver}.tar.gz")
sha512sums=('2e6d0f0555adc5eec143dd784d360e33c1a93b8cbab92931ee6778663ccc600e4d040d1e8492bc5085597893f6778b47c6f52a7a894c29c6ed796a323ff06d39')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # Install the plugin script
  install -Dm644 wee_slack.py "${pkgdir}/usr/lib/weechat/python/wee_slack.py"

  # Install the emoji tab completion dictionary
  install -Dm644 weemoji.json "${pkgdir}/usr/lib/weechat/weemoji.json"

  # Install the plugin license
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
