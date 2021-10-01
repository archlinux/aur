# Maintainer: Your Name <youremail@domain.com>
pkgname=perimeter81
pkgver=latest
pkgrel=1
pkgdesc='Perimeter81 agent application'
arch=('x86_64')
url='https://support.perimeter81.com/docs/downloading-the-agent'
license=('custom:LICENSE')
depends=('systemd')
options=(!strip)
source=(
  'https://static.perimeter81.com/agents/linux/snapshot/latest/Perimeter81.deb'
  'perimeter81helper.service'
)
md5sums=(
  'SKIP'
  'SKIP'
)

prepare() {
  bsdtar -xf data.tar.xz
}

pkgver() {
  bsdtar -Oxf control.tar.gz control | awk '/Version:/{gsub(/\-/, ".", $2); print $2}'
}

package() {
  cp -r opt usr $pkgdir/
  install -Dm644 $srcdir/perimeter81helper.service $pkgdir/usr/lib/systemd/system/perimeter81helper.service
}
