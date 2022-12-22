# Maintainer: Stefan Tatschner <stefan@rumpelsepp.org>

pkgname=gallia
pkgver=1.1.2
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
makedepends=("python-poetry" "python-installer" "git")
source=("https://github.com/Fraunhofer-AISEC/gallia/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('0a98d43905efa8a434fb626db540a4d7c15ef91d7cbb1814c6541debe25f7b76')

build() {
    cd "$pkgname-$pkgver"
	poetry build
}

package() {
    cd "$pkgname-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl

	register-python-argcomplete --shell bash gallia | install -Dm644 /dev/stdin "${pkgdir}"/usr/share/bash-completion/completions/gallia
	register-python-argcomplete --shell fish gallia | install -Dm644 /dev/stdin "${pkgdir}"/usr/share/fish/vendor_completions.d/gallia.fish
}
