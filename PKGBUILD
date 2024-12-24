# Maintainer: Chi_Tang <me@chitang.dev>
# Contributor:  <noreply@chitang.dev>
pkgname=viddy-git
pkgver=1.3.0.r5.gad1f0fe
pkgrel=1
pkgdesc="A modern watch command"
arch=('any')
url="https://github.com/sachaos/viddy"
license=('MIT')
options=('!lto')
makedepends=('cargo')
provides=('viddy')
conflicts=('viddy' 'viddy-bin')
source=("git+https://github.com/sachaos/viddy.git")
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/viddy"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/viddy"
	cargo build --release --locked
}

package() {
	cd "${srcdir}/viddy"
	install -Dm755 "target/release/viddy" "${pkgdir}/usr/bin/viddy"
}
