# Maintainer: solnce <echo c29sbmNlQHJhdGFqY3phay5vbmU= | base64 -d>
pkgname=pacdef-git
_pkgname=pacdef
pkgver=1.2.0+r0.g9a66a03
pkgrel=1
pkgdesc='multi-backend declarative package manager for Linux'
url="https://github.com/steven-omaha/${_pkgname}"
source=("git+https://github.com/steven-omaha/${_pkgname}")
arch=('x86_64')
license=('GPL3')
depends=('gcc-libs')
conflicts=('pacdef')
provides=('pacdef')
makedepends=('git' 'rust')
sha256sums=(SKIP)

build() {
  cd "${srcdir}/${_pkgname}"
  cargo build --release --features arch
}

check() {
  cd "${srcdir}/${_pkgname}"
  cargo test --workspace --features arch
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -Dm755 target/release/pacdef "${pkgdir}/usr/bin/pacdef"
  install -Dm644 _completion.zsh "${pkgdir}/usr/share/zsh/site-functions/_pacdef"
}

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags --match "v*" | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/+/;s/-/./g'
}

