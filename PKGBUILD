# Maintainer: Andrew Scott <aur at andyscott dot me>
pkgname=smartmontools-s6
pkgver=20230415
pkgrel=1
pkgdesc="s6 service scripts for smartmontools"
arch=('any')
url="https://codeberg.org/andyscott/s6-scripts"
license=('GPL2')
provides=('init-smartmontools')
depends=('s6' 'smartmontools')
conflicts=('init-smartmontools')
backup=('etc/s6/config/smartd.conf')
source=('https://codeberg.org/andyscott/s6-scripts/raw/branch/main/smartmontools/smartd.conf'
        'smartd-log.consumer-for::https://codeberg.org/andyscott/s6-scripts/raw/branch/main/smartmontools/smartd-log/consumer-for'
        'smartd-log.notification-fd::https://codeberg.org/andyscott/s6-scripts/raw/branch/main/smartmontools/smartd-log/notification-fd'
        'smartd-log.pipeline-name::https://codeberg.org/andyscott/s6-scripts/raw/branch/main/smartmontools/smartd-log/pipeline-name'
        'smartd-log.run::https://codeberg.org/andyscott/s6-scripts/raw/branch/main/smartmontools/smartd-log/run'
        'smartd-log.type::https://codeberg.org/andyscott/s6-scripts/raw/branch/main/smartmontools/smartd-log/type'
        'smartd-srv.producer-for::https://codeberg.org/andyscott/s6-scripts/raw/branch/main/smartmontools/smartd-srv/producer-for'
        'smartd-srv.run::https://codeberg.org/andyscott/s6-scripts/raw/branch/main/smartmontools/smartd-srv/run'
        'smartd-srv.type::https://codeberg.org/andyscott/s6-scripts/raw/branch/main/smartmontools/smartd-srv/type')
b2sums=('8f907d5b13160d4a8f7caa5625881bf38491afe69ee82fb90dfd661bb452881e7cf72bae214d540402efafc7c847a872c11a91d32bb401d4aabda683ecc3a0e9'
        '1016e77f2a980682a6945011846ae3eb68ade073472351e31eee9533bab902d9727b319767e447d23d1e14d5f2564a64dec72d05023bf45cfe9c08919810e7c6'
        'dfb4f0a38f1ba4731ab1e568b7ec45fa2977d1661b5d1b3a7bb79d49b900d7849a78ef67af65243b357d8a209f379e6f026f86efdce430256f6fadc8ce2b0a49'
        '2b2ae21a22a171affda7302ee794742ec3f6f21ecb57f12ab0b038ab554af9087a153b0984e112de23ee21957fb3f0ab3a8a6a272750678d70a795e753bec427'
        '327cb714ceeba0ba7656f6ece62c43e5dd163f054dc5ef6c5312d570b8c8d59bf70f99dc2d6937164344c7c235301f04624dbe6f5787e366466bfe2a20948888'
        'd64d49cff4f8f99eb08cf0a31d20f5b6908fabfcc055feab7d5b260bbdae4a39fc5e7be8d91a0d8f97ffe6da2d3924c4c3fa91be18130bc144fdd42a8e63de85'
        '7d7eee69b07ddc4c730c4c66995c8d95fde41eaaf64fda68d146719d5632e9ecae4ecc6a1bc6df8905330cc31aa310b35d70fdcc4575f8f98c89aad027b8116b'
        '49c5ea4ab37abe0a06bfbc5bbb6157b1d0c39fdb644fb71e85e9bfbb7875f5e6b4f1d3163ca0dff3db69912e99ecb2705222ced2d8413cef2e7ee1ad1a473fd8'
        'd64d49cff4f8f99eb08cf0a31d20f5b6908fabfcc055feab7d5b260bbdae4a39fc5e7be8d91a0d8f97ffe6da2d3924c4c3fa91be18130bc144fdd42a8e63de85')

_inst_sv() {
  for file in consumer-for notification-fd pipeline-name producer-for run type; do
    if test -f "$1.$file"; then
      install -Dm644 "$1.$file" "$pkgdir/etc/s6/sv/$1/$file"
    fi
  done
}

package() {
  _inst_sv 'smartd-log'
  _inst_sv 'smartd-srv'
  install -Dm644 "smartd.conf" -t "$pkgdir/etc/s6/config"
}
