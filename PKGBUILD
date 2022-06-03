# Maintainer: orhun <orhunparmaksiz@gmail.com>
# Contributor: Tony Lambiris <tony@libpcap.net>
# https://github.com/orhun/pkgbuilds

pkgname=hx-git
pkgver=0.4.2.r2.g21b2304
pkgrel=1
pkgdesc="Futuristic take on hexdump (git)"
arch=('x86_64')
url="https://github.com/sitkevij/hex"
license=('MIT')
makedepends=('rust' 'git')
conflicts=('hex')
provides=('hex')
source=("${pkgname}::git+${url}")
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"

  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//g'
}

build() {
  cd "${srcdir}/${pkgname}"

  cargo build --release --locked
}

check() {
  cd "${srcdir}/${pkgname}"

  cargo test --release --locked
}

package() {
  cd "${srcdir}/${pkgname}"

  install -Dm 755 "target/release/${pkgname%-git}" -t "${pkgdir}/usr/bin"
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
