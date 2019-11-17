# Maintainer: Benjamin Levy <blevy@protonmail.com>
pkgname=pwninit
pkgver=1.2.1
pkgrel=1
depends=('elfutils')
makedepends=('rust' 'cargo')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="pwninit - automate starting binary exploit challenges"
license=('MIT')
url="https://github.com/io12/pwninit"
source=("https://github.com/io12/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('910a96c3bca003fe78aa557e2462e62c')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo build --release --locked
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo test --release --locked
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm 755 target/release/${pkgname} -t "${pkgdir}/usr/bin"
}
