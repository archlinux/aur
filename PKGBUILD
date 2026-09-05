# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=python-lotc-git
_pkgname=lotc-git
pkgver=r57.bc236a2
pkgrel=1
pkgdesc="Video downloader, trimmer and merger for the terminal"
arch=('any')
url="https://github.com/ranelpadon/lord-of-the-clips"
license=('MIT')
depends=('python' 'yt-dlp' 'python-moviepy')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools')
provides=('lotc')
conflicts=('lotc')
source=("lotc::git+https://github.com/ranelpadon/lord-of-the-clips.git")
sha256sums=('SKIP')

pkgver() {
	cd lotc
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd lotc
	python -m build --wheel --no-isolation
}

package() {
	cd lotc
	python -m installer --destdir="$pkgdir" dist/*.whl
	if [ -f LICENSE ]; then
		install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
	fi
}
