# Maintainer: Benjamin Levy <blevy@protonmail.com>
pkgname=pwninit
pkgver=2.2.0
pkgrel=0
provides=('pwninit')
depends=('elfutils')
makedepends=('rust' 'cargo')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="pwninit - automate starting binary exploit challenges"
license=('MIT')
url="https://github.com/io12/pwninit"
source=("https://github.com/io12/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('6c7777c8aaf7c53d0f54f25a72c72e8e')

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
