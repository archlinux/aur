# Maintainer: Viech <viech unvanquished net>

pkgname=unvtray
_gitname=unvanquished-tray-browser
pkgver=0.1.0
pkgrel=1
pkgdesc='A minimalistic Unvanquished server browser that runs in the system tray.'
arch=('any')
url="https://github.com/Unvanquished/${_gitname}"
license=('GPL3')
depends=('python-pillow' 'python-pystray')
optdepends=(
        'unvanquished: launch and play the game'
        'xdg-utils: click on a server to connect to it'
)
makedepends=('python-build' 'python-installer' 'python-setuptools-scm')
source=("https://github.com/Unvanquished/${_gitname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('85faffb5e2895a7377726fd21b259ef5db83aa43250f65f2b852d308fe98a17f')

build() {
	cd "${srcdir}/${_gitname}-${pkgver}"
	SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver} python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/${_gitname}-${pkgver}"
	python -m installer --destdir="$pkgdir" "dist/unvtray-${pkgver}-py3-none-any.whl"
}
