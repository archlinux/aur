# Maintainer: Stefan Tatschner <stefan@rumpelsepp.org>

pkgname=gallia
pkgver=1.5.0
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
	"python-pydantic"
	"python-exitcode"
	"python-platformdirs"
)
makedepends=("python-poetry" "python-build" "python-installer" "git")
source=("https://github.com/Fraunhofer-AISEC/gallia/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9f29786b536c735f142bde1bdc2b5fe15ab691626079524d1929f91c90675d40')

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
