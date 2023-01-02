# Maintainer: Stefan Tatschner <stefan@rumpelsepp.org>

pkgname=gallia
pkgver=1.1.3
pkgrel=1
pkgdesc='Extendable Pentesting Framework'
arch=(any)
url="https://github.com/Fraunhofer-AISEC/gallia"
license=("apache")
depends=(
	"python"
	"python-pydantic"
	"python-aiohttp"
	"python-aiofiles"
	"python-aiosqlite"
	"python-argcomplete"
	"python-zstandard"
	"python-can"
	"python-tabulate"
	"python-pygit2"
	"python-msgspec"
)
makedepends=("python-poetry" "python-build" "python-installer" "git")
source=("https://github.com/Fraunhofer-AISEC/gallia/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('2be55b80143b707db525b82a06c58434de1f1327ec7c409b833c4e49e3b1012c')

build() {
	cd "$pkgname-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$pkgname-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl

	register-python-argcomplete --shell bash gallia | install -Dm644 /dev/stdin "${pkgdir}"/usr/share/bash-completion/completions/gallia
	register-python-argcomplete --shell fish gallia | install -Dm644 /dev/stdin "${pkgdir}"/usr/share/fish/vendor_completions.d/gallia.fish
}
