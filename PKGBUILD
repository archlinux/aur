# Contributor: Sebastien Duquette <ekse.0x@gmail.com>
# Contributor: Martin Poljak <mmartin@poljak.cz>

pkgname=pfclient-beta-bin
pkgver=3.0.2080
pkgrel=2
pkgdesc="Planefinder.net sharing client"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://planefinder.net/sharing/client"
license=(unknown)
install=pfclient-beta-bin.install
backup=('etc/pfclient/pfclient-config.json')

__pfsource_arm="http://client.planefinder.net/pfclient_${pkgver}_armhf.tar.gz"
__pfsource_arm_md5="761a109f7dcc3a485958a74c7a7b27bd"
__pfsource_i386="http://client.planefinder.net/pfclient_${pkgver}_i386.tar.gz"
__pfsource_i386_md5="847b20295732909a4e28c8ea8fa17002"

source=(
    "pfclient-beta.service"
)
md5sums=(
    'f2f2b11d1bd4fd216480071467a95b09'
)


###

source_armv6h=($__pfsource_arm)
source_armv7h=($__pfsource_arm)
source_i686=($__pfsource_i386)
source_x86_64=($__pfsource_i386)

md5sums_armv6h=($__pfsource_arm_md5)
md5sums_armv7h=($__pfsource_arm_md5)
md5sums_i686=($__pfsource_i386_md5)
md5sums_x86_64=($__pfsource_i386_md5)

prepare() {
  if [[ $CARCH == 'i686' || $CARCH == 'x86_64' ]]; then
    __pfarch="i386"
  else
    __pfarch="armhf"
  fi
  
  cd "$srcdir"
  tar -xzf pfclient_${pkgver}_$__pfarch.tar.gz
}

package() {
  mkdir -p "$pkgdir"/usr/bin
  mkdir -p "$pkgdir"/etc/pfclient
  mkdir -p "$pkgdir"/usr/lib/systemd/system
  
  install "$srcdir"/pfclient "$pkgdir"/usr/bin/pfclient-beta
  install "$srcdir"/pfclient-beta.service "$pkgdir"/usr/lib/systemd/system
  touch "$pkgdir"/etc/pfclient/pfclient-config.json
}

#Y vim:set ts=2 sw=2 et:
