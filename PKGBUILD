# Maintainer: Thomas Millward Wright <tmillwardwright@gmail.com>
pkgname=perimeter81
pkgver=9.0.1.843
pkgrel=1
pkgdesc='Perimeter81 agent application'
arch=('x86_64')
url='https://support.perimeter81.com/docs/downloading-the-agent'
license=('custom:LICENSE')
depends=('systemd' 'netcat')
options=(!strip)
source=(
  "https://static.perimeter81.com/agents/linux/Perimeter81_${pkgver}.deb"
  'perimeter81helper.service'
  'LICENSE'
)
md5sums=(
  '54711cd4f1dd4927535e76b3ee5e9c41'
  '089b611fb1ecbd3e39e2d2d391743205'
  '64c25ccc5446c93c6073a418f664d3d5'
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
  install -Dm644 $srcdir/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
