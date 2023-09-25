# Maintainer:  <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='bandwhich'
pkgname="${_pkgname}-git"
pkgver=0.21.0.r7.ge2023ed
pkgrel=1
pkgdesc='Terminal bandwidth utilization tool'
arch=('x86_64')
url='https://github.com/imsnif/bandwhich'
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo' 'git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+${url}.git"
        "https://raw.githubusercontent.com/imsnif/bandwhich/8cc56ced73cc5055f69f8723122fb8b5a526b422/Cargo.lock")
sha256sums=('SKIP'
            'd64b3583b47826e0d72dfa6c4a2d473b5eb55ccb4f15573c73b9cd54e4ce0cc3')

pkgver() {
  git -C "${_pkgname}" describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  mv Cargo.lock "${_pkgname}"
}

build() {
	cd "${_pkgname}"
  cargo build --release --all-features --target-dir=target
}

package() {
	cd "${_pkgname}"
  install -Dm755 -t "${pkgdir}/usr/bin" "target/release/${_pkgname}"
  install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" 'README.md'
  install -Dm644 -t "${pkgdir}/usr/share/man/man1" "docs/${_pkgname}.1"
  install -Dm644 'LICENSE.md' "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
