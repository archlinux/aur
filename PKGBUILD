# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=streampager
pkgname=${_pkgname}-git
pkgver=0.8.0.r1.gb562cb0
pkgrel=1
pkgdesc='A pager for command output or large files'
url='https://github.com/markbt/streampager'
license=('MIT')
arch=('x86_64')
depends=('gcc-libs')
makedepends=('git' 'rust')
source=("${_pkgname}::git+https://github.com/markbt/streampager.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${_pkgname}"

  cargo build --release --locked --all-features --target-dir=target
}

package() {
  cd "${_pkgname}"

  install -Dm0755 -t "${pkgdir}/usr/bin" target/release/{sp,spp}

  install -Dm0644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE.md
}
