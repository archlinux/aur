# Maintainer: John Moon <john@jmoon.dev>
# Contributor: John Moon <john@jmoon.dev>
pkgname=metamorpher
pkgver=0.1.1
pkgrel=1
pkgdesc='A tool to convert files into metadata directory structures'
url='https://gitlab.com/JohnMoon/metamorpher'
arch=('x86_64')
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("${url}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('ba9600c790e6fb38954995f69584b9a738b0ad61a01389ddd54a788252821730dbe1e0f0be24b36e96418677e82a36ca2a07e5337f3315d1231b3029e097623c')
b2sums=('276a2d6fbced9a099f02809ae0611300f277dc8a98c370236975036ab17ae286b3eaa8386334e5978a461810934bf3463ff8fc346dd44c4babba32994212d2c6')

prepare() {
  cd "${pkgname}-${pkgver}"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "${pkgname}-${pkgver}"
  cargo build --release --locked --all-features --target-dir=target
}

check() {
  cd "${pkgname}-${pkgver}"
  cargo test --release --locked --target-dir=target
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm 755 "target/release/${pkgname}" -t "${pkgdir}/usr/bin"
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:
