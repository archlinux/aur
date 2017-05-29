# Maintainer: Jan Tojnar <jtojnar@gmail.com>
_provider=enchant
_pkg=patronus
pkgname=${_pkg}-${_provider}
pkgver=0.1.0
pkgrel=1
pkgdesc='Enchant provider for patronus grammar checking library'
url='https://github.com/patronus-checker/patronus'
makedepends=('cargo')
depends=('patronus' 'enchant')
license=('MIT')
source=("https://github.com/patronus-checker/$_pkg/archive/v$pkgver/$_pkg-$pkgver.tar.gz")
sha256sums=('959411b7a9f3bbcf633853f0990f066229670e43acec4a6ac21305c3b581e47a')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
_provider_dir=/usr/lib/patronus

build() {
	cd "$_pkg-$pkgver/providers/${_provider}"
	cargo build --release
}

package() {
	cd "$_pkg-$pkgver"
	install -Dm755 "target/release/lib${_pkg}_${_provider}.so" "${pkgdir}${_provider_dir}/lib${_pkg}_${_provider}.so"
}
