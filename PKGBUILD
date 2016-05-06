# Maintainer: Patrick Burroughs (Celti) <celti@celti.name>

pkgname=multirust-git
pkgdesc='A tool for managing multiple Rust installations.'
url='https://github.com/brson/multirust'
pkgver() { cd ${pkgbase} && git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'; }
pkgver=0.8.0.r9.g0d98a59
pkgrel=2
arch=('any')
license=('MIT' 'Apache')
makedepends=('git')
depends=('bash' 'curl')
provides=('rust' 'cargo' 'rustup')
conflicts=('multirust' 'rust' 'cargo' 'rustup')
source=("$pkgname::git://github.com/brson/multirust.git" 
        'https://raw.githubusercontent.com/rust-lang/rust/master/LICENSE-MIT'
        'https://raw.githubusercontent.com/rust-lang/rust/master/LICENSE-APACHE')
sha256sums=('SKIP'
            '0621878e61f0d0fda054bcbe02df75192c28bde1ecc8289cbd86aeba2dd72720'
            'a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2')

prepare() {
	cd ${pkgbase}
	git submodule update --init
}

build() {
	cd ${pkgbase}
	bash build.sh
}

package() {
	cd ${pkgbase}
	bash install.sh --prefix="${pkgdir}/usr"
	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${srcdir}/LICENSE-MIT" "${srcdir}/LICENSE-APACHE"
}
