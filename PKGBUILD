# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=python-castlocal-git
_pkgname=cast-control
pkgver=r4.fa5aead
pkgrel=1
pkgdesc="Cast any local video to Chromecast, with a CLI (cast) and a retro TUI (cast-tui)"
arch=('any')
url="https://github.com/YuriKovalov22/cast-control"
license=('MIT')
depends=('python' 'python-pychromecast' 'python-textual' 'python-zeroconf' 'ffmpeg')
makedepends=('git' 'python-build' 'python-installer' 'python-hatchling')
provides=('python-castlocal')
conflicts=('python-castlocal')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	cd "$_pkgname"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_pkgname"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
