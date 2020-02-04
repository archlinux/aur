# Maintainer: orhun <orhunparmaksiz@gmail.com>
pkgname=kmon
pkgver=v0.1.0
pkgrel=1
pkgdesc="Linux kernel manager and activity monitor"
arch=('i686' 'x86_64')
url="https://github.com/orhun/kmon"
license=('GPL3')
depends=('libxcb')
makedepends=('cargo' 'git')
provides=("$pkgname")
conflicts=("$pkgname" "${pkgname}-git" "${pkgname}-bin")
source=("https://github.com/orhun/kmon/archive/${pkgver}.tar.gz")
sha512sums=('66bb68147d9bae6dc25c3fa80dd24ea8128c87a576bf1bc706899f20f3dab9185aeb1cf5dd99a01a3f7224040b8a3bc180c3c73f8eb9d35674cc62eca341a001')

build() {
  cd "$pkgname-${pkgver#v}"
  cargo build --release --locked --all-features
}

check() {
  cd "$pkgname-${pkgver#v}"
  cargo test --release --locked
}

package() {
  cd "$pkgname-${pkgver#v}"
  install -Dm 755 "target/release/$pkgname" -t "${pkgdir}/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}