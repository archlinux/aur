# Maintainer: William Gathoye <william at gathoye dot be>
# Maintainer: David Vogt <dave at winged dot ch>
# This PKGBUILD is maintained at https://github.com/winged/aur-packages

pkgname=matterbridge-plus-bin
pkgver=v0.4
pkgrel=2
pkgdesc="Simple bridge between Mattermost and IRC (using the Mattermost API instead of webhooks)"
arch=('x86_64')

url='https://github.com/42wim/matterbridge-plus/'
license=('Apache')

depends=('mattermost')
conflicts=()
provides=('matterbridge-plus' 'matterbridge-plus-bin')

source=(
    "https://github.com/42wim/matterbridge-plus/releases/download/$pkgver/matterbridge-plus-linux64"
    "https://cdn.rawgit.com/42wim/matterbridge-plus/master/matterbridge.conf.sample"
    "matterbridge-plus.service"
    )
sha512sums=(
    22a6769dfd7ed6e3311aa73b2dee4f9210e904bbb32d2dd9fb70240b105e305e568f24ef7a138f49852a6132b399de2148b5bc02852d4df26a25ad747e22b356 
    517b4f3c2c279c76443d576bc6b5d7908e9f1342ade56b39a4a346de98e8c202c5419d2ba36469bd623f90de635edd08a7c4048aee9c66dd5878ba82cf8cec47
    'SKIP' # this is from our own repository...
)

package() {
  install -Dm755 matterbridge-plus-linux64 "$pkgdir/usr/bin/matterbridge-plus"
  install -Dm644 matterbridge.conf.sample  "$pkgdir/usr/share/doc/matterbridge-plus/matterbridge.conf.sample"
  install -Dm644 matterbridge-plus.service "$pkgdir/usr/lib/systemd/system/matterbridge-plus.service"

}

post_install() {
  echo "NOTE: A sample config file installed under"
  echo "      /usr/share/doc/matterbridge-plus/matterbridge.conf.sample."
  echo "To get started, you need to copy it to /etc/matterbridge.conf"
  echo "and configure it properly."
}

