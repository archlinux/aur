# Maintainer: Benjamin Denhartog <ben@sudoforge.com>

pkgname=weechat-notify-send
pkgver=0.8
pkgrel=1
pkgdesc="A WeeChat script that sends highlight and message notifications through notify-send"
url='https://github.com/s3rvac/weechat-notify-send'
arch=('any')
license=('MIT')
depends=(
  'libnotify'
  'python'
  'weechat'
)
source=("${pkgname}_${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('250814152ea6d123aa4c48fb40648fe490134121a62253c692fcddb1eba05e28bda7523182fbb1db13a41f7a38d63e2e56ea97584d0c06321c4d56f6d701a985')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 "Installing the notify_send.py plugin"
  install -Dm644 notify_send.py ${pkgdir}/usr/lib/weechat/python/notify_send.py

  msg2 "Installing license"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  msg2 "Since WeeChat does not yet load plugins in the system path, you need"
  msg2 "to load the script from your user path. Use symlnks so that you can"
  msg2 "benefit from package upgrades via pacman."
  msg2 "    $ ln -s /usr/lib/weechat/python/notify_send.py $HOME/.weechat/python/notify_send.py"
}

# vim:set ts=2 sw=2 et:
