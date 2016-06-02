# Maintainer: David Vogt <dave at winged dot ch>
# This PKGBUILD is maintained at https://github.com/winged/aur-packages

pkgname=matterbridge-plus-bin
_pkgname=matterbridge-plus-bin
pkgver=v0.3.1
pkgrel=1
pkgdesc="Simple bridge between mattermost and IRC. (Uses the mattermost API instead of webhooks)"
arch=('x86_64')
license=('Apache')
url='https://github.com/42wim/matterbridge-plus/'
depends=('mattermost')
conflicts=()
provides=('matterbridge-plus' 'matterbridge-plus-bin')
makedepends=()
source=(
    "https://github.com/42wim/matterbridge-plus/releases/download/$pkgver/matterbridge-plus-linux64"
    "https://raw.githubusercontent.com/42wim/matterbridge-plus/master/matterbridge.conf.sample"
    "LICENSE::https://raw.githubusercontent.com/42wim/matterbridge-plus/master/LICENSE"
    "matterbridge-plus.service"
    )
sha256sums=(
    '13afa3c043757de9f1572a0f2d509a239ee2acc0f6e1d5448e21020e07d7a220'
    '3d214bf9496e3b8660a65ce50ac36f65c16b7152fd9a2badf7add17a9b0693d9'
    'c6596eb7be8581c18be736c846fb9173b69eccf6ef94c5135893ec56bd92ba08'
    'SKIP' # this is from our own repository...
)


package() {
  install -Dm644 LICENSE                   "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
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

# vim:set ts=2 sw=2 et:
