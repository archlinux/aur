# Maintainer: Lazerbeak12345 <contact me on github or mastodon>
pkgname=incus-s6
pkgver=20251208
pkgrel=2
pkgdesc="s6 service scripts for incus"
arch=('any')
depends=('incus' 's6')
provides=('init-incus')
conflicts=('init-incus')
backup=('etc/s6/config/incus.conf')
source=('incus.conf'
        'incus.run'
        'incus.type')
b2sums=('092d566b9d71fe21b8dc088c03a088d45fedfb35d7b7a1f65f6fa0c86e8cb6d592a10f48c0db53eda11ba35fef65b28e893bbb6e04c51416b826635696ed5220'
        'ff16d0fd35046e238beba56b907bd20957d24ac149e9e3f12de399ca25e1d2d9b82646d21ee4db8fc44af5bc77de91d7ec8050418f62dcafe999450b29200d83'
        'd64d49cff4f8f99eb08cf0a31d20f5b6908fabfcc055feab7d5b260bbdae4a39fc5e7be8d91a0d8f97ffe6da2d3924c4c3fa91be18130bc144fdd42a8e63de85')
_inst_sv() {
  for file in consumer-for notification-fd pipeline-name producer-for run type; do
    if test -f "$1.$file"; then
      install -Dm644 "$1.$file" "$pkgdir/etc/s6/sv/$1/$file"
    fi
  done
}

package() {
  _inst_sv 'incus'
  install -Dm644 "incus.conf" -t "$pkgdir/etc/s6/config"
}
