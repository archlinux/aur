# Maintainer: Dan Beste <dan.ray.beste@gmail.com>

pkgname='fd-git'
pkgver=5.0.0.r3.gc022528
pkgrel=1
pkgdesc='A simple, fast and user-friendly alternative to find.'
arch=('i686' 'x86_64')
url='https://github.com/sharkdp/fd'
license=('APACHE' 'MIT')
makedepends=('cargo' 'git' 'rust')
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

package() {
  cd "${pkgname}"

  install -m 755 \
    -D "target/release/${pkgname/-git}" "${pkgdir}/usr/bin/${pkgname/-git}"
  install -m 644 \
    -D LICENSE-APACHE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
  install -m 644 \
    -D LICENSE-MIT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
}

# vim: ts=2 sw=2 et:
