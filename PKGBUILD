# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=python-nless
_pkgname=nothing-less
pkgver=1.17.0
pkgrel=1
pkgdesc="TUI pager with enhanced support for tabular data and real-time streaming"
arch=('any')
url="https://github.com/mpryor/nothing-less"
license=('MIT')
depends=('python>=3.13' 'python-textual' 'python-pyperclip' 'python-packaging' 'tzdata')
optdepends=('xclip: clipboard support on X11' 'xsel: clipboard support on X11' 'wl-clipboard: clipboard support on Wayland')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-poetry-core')
checkdepends=('python-pytest' 'python-pytest-asyncio')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('d031eba926f6901fa8a359998e441b6e4e0dbe28d6cc5dea162a956569517d73')

build() {
	cd "$_pkgname-$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	cd "$_pkgname-$pkgver"
	python -m pytest tests -v -m "not perf"
}

package() {
	cd "$_pkgname-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
