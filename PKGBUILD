# Maintainer: Dan Beste <dan.ray.beste@gmail.com>

pkgname='fd-rs-git'
pkgver=5.0.0.r3.gc022528
pkgrel=1
pkgdesc='A simple, fast and user-friendly alternative to find.'
arch=('i686' 'x86_64')
url='https://github.com/sharkdp/fd'
license=('APACHE' 'MIT')
makedepends=('git' 'rust')
provides=("${pkgname/-git}")
conflicts=("${pkgname/-git}")
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
    "target/release/${pkgname/-rs-git}" \
    "${pkgdir}/usr/bin/${pkgname/-rs-git}"
  install -m 644   \
    LICENSE-APACHE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
  install -m 644 \
    LICENSE-MIT  \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
}

# vim: ts=2 sw=2 et:
