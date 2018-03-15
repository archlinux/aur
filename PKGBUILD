# Maintainer: kpcyrd <git@rxv.cc>

pkgname=badtouch
pkgver=0.1.0
pkgrel=2
pkgdesc="Scriptable network authentication cracker"
url="https://github.com/kpcyrd/badtouch"
depends=('gcc-libs')
makedepends=('cargo')
arch=('i686' 'x86_64' 'armv6h' 'aarch64')
license=('GPL3')
source=("$pkgname-$pkgver.tar.gz::https://github.com/kpcyrd/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('4859f0bf93bcd7c95c6eed6baa1c3b833021f0ce101c48ca2bb8f40ec171720c147fd51b93a92c38fd1a46dd4dddfe15dd2b656b8c4c86ad2438a4396aaa20ad')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set ts=2 sw=2 et:
