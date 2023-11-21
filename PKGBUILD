# Maintainer: Václav Kubernát <sir.venceslas@gmail.com>

pkgname=pyshv-git
_gitname=pyshv
pkgver=r159.55379a9
pkgrel=1
pkgdesc='Python implementation of CPON, Chainpack and SHV RPC'
url='https://gitlab.com/elektroline-predator/pyshv'
arch=('i686' 'x86_64' 'armv7h')
license=('BSD')
depends=('python-pyserial-asyncio' 'python-aioserial' 'python-dateutil')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-pytest' 'python-pytest-asyncio' 'libshv')
conflicts=('pyshv' 'pyshv-git')
provides=('pyshv')
source=('git+https://gitlab.com/elektroline-predator/pyshv.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_gitname"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$_gitname"
	python -m build --wheel --no-isolation
}

check() {
	cd "$srcdir/$_gitname"
	pytest
}

package() {
	cd "$srcdir/$_gitname"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
