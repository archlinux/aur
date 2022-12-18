# Maintainer: Florian Wickert <FlorianWickert@gmail.com>
pkgname=minmon
pkgver=0.2.0
pkgrel=1
pkgdesc="An opinionated minimal monitoring and alarming tool."
arch=('any')
url="https://github.com/flo-at/minmon"
license=('MIT')
depends=('openssl')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/v0.2.0.tar.gz")
sha512sums=('2a3069ff06b94d42f7df0ecf7923129ef5f03ff3a0de13453da5fd4d41edd13af5ceffccddbb08e8cf0b2b1cbfefe6278b07acc6c122eaee95eda91d75540c05')

prepare() {
  cd "${pkgname}-${pkgver}"
  cargo fetch --locked
}

build() {
  cd "${pkgname}-${pkgver}"
  cargo build --release --locked --all-features
}

check() {
  cd "${pkgname}-${pkgver}"
  cargo test --release --locked --all-features
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm 755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 systemd.minmon.service $pkgdir/usr/lib/systemd/system/minmon.service
}
