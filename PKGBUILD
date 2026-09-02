pkgname=wee-slack-git
pkgdesc='A WeeChat plugin for Slack'
pkgver=2.10.2.r502.gaa904c2
pkgrel=1
url='https://github.com/wee-slack/wee-slack/'
arch=('any')
license=('MIT')

makedepends=(
  'git'
)

conflicts=(
  'wee-slack'
)

source=(
  'git+https://github.com/wee-slack/wee-slack'
)

sha512sums=(
  'SKIP'
)

pkgver() {
  cd wee-slack
  git describe --long | sed 's/^v//;s/-/.r/;s/-/./g'
}

package() {
  depends+=(
    'python-websocket-client'
    'weechat'
  )

  cd wee-slack
  ./build.sh
  install -Dm644 build/slack.py "${pkgdir}/usr/share/weechat/python/wee_slack.py"
  install -Dm644 weemoji.json "${pkgdir}/usr/share/weechat/weemoji.json"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/wee-slack/LICENSE"
}
