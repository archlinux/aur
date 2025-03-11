# Maintainer: Thomas Millward Wright <tmillwardwright@gmail.com>
pkgname=perimeter81
pkgver=10.0.1.885
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
sha256sums=('fbc109d03d1e65e1e20fb4f1f6b590ea0fa596b4f86a701ddf88b06e97e91c89'
            'c1fa2c85ae4e58cb2e5b1058f4f68ca43ca8e295e9159f0e14ebcedc97e27f89'
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
