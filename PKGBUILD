pkgname=fireurl
pkgver=0.3.0
pkgrel=1
pkgdesc="Fixing the firejail URL open issue"
arch=('x86_64')
url="https://github.com/rusty-snake/fireurl"
license=('MIT')
depends=('firejail')
makedepends=('cargo')
source=("https://github.com/rusty-snake/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
	    "fireurld.service")
sha256sums=('3491f541d2ab89e3fe383a384bbc24b567cb244713b9ef1238ae0536926a1775'
            'ac27ec7bd40217cd9637dba5729b591821f7e676191c6f029effb6299a156d7c')

build() {
  cd "$pkgname-$pkgver"

  cargo build --release
}

package() {
  install -Dm0644 fireurld.service $pkgdir/usr/lib/systemd/user/fireurld.service
  cd "$pkgname-$pkgver"
  install -Dm0755 target/release/fireurl $pkgdir/usr/bin/fireurl
  install -Dm0755 target/release/fireurld $pkgdir/usr/bin/fireurld
}
