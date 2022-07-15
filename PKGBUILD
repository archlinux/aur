# Maintainer: Stefan Tatschner <stefan@rumpelsepp.org>

pkgname=gallia
pkgver=1.0.3
pkgrel=1
pkgdesc='Extendable Pentesting Framework '
arch=(any)
url="https://github.com/Fraunhofer-AISEC/gallia"
license=("apache")
depends=("python" "python-aiohttp" "python-aiofiles" "python-aiosqlite" "python-argcomplete" "python-zstandard" "python-can" "python-tabulate")
makedepends=("python-poetry" "python-installer" "git")
source=("https://github.com/Fraunhofer-AISEC/gallia/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9b0ed6cc352701b133ee3ca8ef6a6fe18c89e7958d43c15e5569b5299fd5be19')

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
