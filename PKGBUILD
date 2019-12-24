# Maintainer: Kaare Jenssen <kaare at jenssen dot it>
# Contributor: Dan Beste <dan.ray.beste@gmail.com>

pkgname='fd-git'
pkgver=7.4.0.r13.g762f551
pkgrel=1
pkgdesc='A simple, fast and user-friendly alternative to find.'
arch=('i686' 'x86_64')
url='https://github.com/sharkdp/fd'
license=('APACHE' 'MIT')
makedepends=('git' 'rust')
provides=('fd')
conflicts=('fd')
source=("${pkgname}::git+https://github.com/sharkdp/fd.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"

  git describe --long --tags \
    | sed 's/v//g;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname}"

  cargo build --release
}

check() {
  cd "${pkgname}"

  cargo test
}

package() {
  cd "${pkgname}"

  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"

  install -m 755                        \
    "target/release/${pkgname/-git}" \
    "${pkgdir}/usr/bin/${pkgname/-git}"
  install -m 644   \
    LICENSE-APACHE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
  install -m 644 \
    LICENSE-MIT  \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
}
