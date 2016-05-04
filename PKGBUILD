# Maintainer: Patrick Burroughs (Celti) <celti@celti.name>

pkgname=multirust-git
pkgdesc='A tool for managing multiple Rust installations.'
url='https://github.com/brson/multirust'
pkgver() { cd ${pkgbase} && git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'; }
pkgver=0.8.0.r9.g0d98a59
pkgrel=1
arch=('any')
license=('MIT' 'Apache')
source=("$pkgname::git://github.com/brson/multirust.git")
sha256sums=('SKIP')
makedepends=('git')
depends=('bash' 'curl')
provides=('rust' 'cargo' 'rustup')
conflicts=('multirust' 'rust' 'cargo' 'rustup')

prepare() {
	cd ${pkgbase}
	git submodule update --init
	curl -OO https://github.com/rust-lang/rust/blob/master/LICENSE-{MIT,APACHE}
}

build() {
	cd ${pkgbase}
	bash build.sh
}

package() {
	cd ${pkgbase}
	bash install.sh --prefix="${pkgdir}/usr"
	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE-{MIT,APACHE}
}
