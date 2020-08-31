# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Jeff Wright <jeff@teamjk.page>

_pkgname='diskonaut'
pkgname="${_pkgname}-git"
pkgver=0.9.0.r1.ged3e92e
pkgrel=1
pkgdesc='Terminal disk space navigator'
arch=('x86_64')
url='https://github.com/imsnif/diskonaut'
license=('MIT')
makedepends=('cargo' 'git')
checkdepends=('cargo')
provides=("${_pkgname}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  git -C "${_pkgname}" describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${_pkgname}"
  cargo build --release --locked --all-features --target-dir=target
}

check() {
	cd "${_pkgname}"
  cargo test --release --locked --target-dir=target
}

package() {
	cd "${_pkgname}"
  install -Dm755 -t "${pkgdir}/usr/bin" "target/release/${_pkgname}"
  install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" 'README.md'
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${_pkgname}" 'LICENSE'
}

# vim: ts=2 sw=2 et:
