# Maintainer: Stefan Gruenberger <stefan.gruenberger at gmail dot com>
# Maintainer: Thomas Millward Wright <tmillwardwright@gmail.com>
pkgname=perimeter81
pkgver=10.0.3.933
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
sha256sums=('faca3092e5a501f6a44bb356130fc50e5ee97a36aee6f059d1e2dcd712cefdc6'
            '3a081715b806d54b09d65f17c0f38c0ce40d99b9157555f6c63245afcc702baf'
            'c505b227d3f2222305800c16805f29b8da3bf841bf71df36674a695528bd0731')

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
