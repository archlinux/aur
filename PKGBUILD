# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: xiretza <xiretza+aur@xiretza.xyz>
_pkgname=Red-Lavalink
pkgname=python-red-lavalink
pkgver=0.11.0rc0
pkgrel=2
pkgdesc="Lavalink client library used in Red-DiscordBot"
arch=(any)
url="https://github.com/Cog-Creators/Red-Lavalink"
license=('GPL3')
depends=('python-discord' 'python-red-commons')
makedepends=('python-setuptools')
checkdepends=('python-pytest-asyncio')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz" "https://github.com/Cog-Creators/Red-Lavalink/commit/93d76d490ac0bb2883e6ff717e4eb09a4a729d01.patch")
sha256sums=('59116b7b260472c76e6d40542a2c85fc099857de280954f52b69e7b9a51eba40' '7d521be8da6e89835d6838db367a11582c2a3b09754b9371b5b2b218c7afbaa7')

prepare() {
	cd "$_pkgname-$pkgver"
	patch -Np1 -i ../93d76d490ac0bb2883e6ff717e4eb09a4a729d01.patch
}
build() {
	cd "$_pkgname-$pkgver"
	python setup.py build
}

check() {
	cd "$_pkgname-$pkgver"
	pytest
}

package() {
	cd "$_pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
