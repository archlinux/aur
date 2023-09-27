# Maintainer: Stefan Tatschner <stefan@rumpelsepp.org>

pkgname=gallia
pkgver=1.3.0
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
sha256sums=('f1a307f2b6a401a2edaddb0ca20388f3c0e0e85cb7cecb1a09d6a2d4162c1ea3')

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
