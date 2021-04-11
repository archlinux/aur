# Maintainer: Julien Nicoulaud <julien.nicoulaud@gmail.com>
pkgname=docuum
pkgver=0.16.1
pkgrel=1
pkgdesc="LRU eviction of Docker images."
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/stepchowfun/docuum"
license=('MIT')
makedepends=('rust' 'cargo')
depends=('docker')
conflicts=("${pkgname}-git")
install="${pkgname}.install"
backup=("etc/default/${pkgname}")
source=("https://github.com/stepchowfun/${pkgname}/archive/v${pkgver}.tar.gz"
        "${pkgname}.service")
sha512sums=('3b5bc289750f1ff3fd6a7a19f0741493cf410e380e2fb2b19bf117f7c5744ee482adf5f35f16dfaad04a7888c35deb04ff74c2cfdd280480d39f9ae4cacb539b'
            '85a89a40202b0fab03da74c98aeb34a8ab14016f8152b13ace19cd274a453359f51d2261ece31f1e039857d131b1cbbb3513e525fbea9313233069bd1def5048')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo build --release
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo test --release
}

package() {
  cd "${srcdir}"
  install -Dm 755 "${pkgname}-${pkgver}/target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm 644 "${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
}
