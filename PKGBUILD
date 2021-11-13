pkgname=hyperx-cloud-flight-git
pkgver=0.1.3.0.gfac59f3
pkgrel=1
pkgdesc='HyperX Cloud Flight Battery and Mute Monitoring (GIT version)'
arch=('x86_64')
url='https://github.com/kondinskis/hyperx-cloud-flight'
license=('MIT')
depends=('dbus'
         'hidapi'
         )
makedepends=('git'
             'cargo'
             )
provides=('hyperx-cloud-flight')
conflicts=('hyperx-cloud-flight')
source=('git+https://github.com/kondinskis/hyperx-cloud-flight.git'
        )
sha256sums=('SKIP')

pkgver() {
  cd hyperx-cloud-flight
  echo "$(git describe --long --tags | tr - .)"
}

build() {
  cd hyperx-cloud-flight
  cargo build --release -vv
}

package() {
  cd hyperx-cloud-flight
  install -Dm755 target/release/cloud-flight "${pkgdir}/usr/bin/cloud-flight"

  install -Dm644 99-hyperx-cloud-flight.rules "${pkgdir}/usr/lib/udev/rules.d/99-hyperx-cloud-flight.rules"
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
