# Maintainer: Seth Girvan <snth@snthhacks.com>

# Only made a -git version of this package because flipperzero-ufbt does not
# really seem made to be built outside of a git repository, considering that its
# pyproject.toml uses setuptools-git-versioning to generate the version number
# from the git repo.
_pkgname=flipperzero-ufbt
pkgname="${_pkgname}-git"
pkgver=r73.e04b34e
pkgrel=1
pkgdesc="Compact tool for building and debugging applications for Flipper Zero"
arch=('any')
url="https://pypi.org/project/ufbt/"
license=('GPL-3.0-or-later')
depends=('python' 'python-oslex')
makedepends=('python-build')
source=("git+https://github.com/flipperdevices/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	cd "$srcdir/$_pkgname"
	python -I -m build --wheel
}

package() {
	cd "$srcdir/$_pkgname"
	python -I -m installer --destdir="$pkgdir" dist/*.whl
}
