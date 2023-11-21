# Maintainer: Václav Kubernát <sir.venceslas@gmail.com>

pkgname=shvcli-git
_gitname=shvcli
pkgver=r52.639c03c
pkgrel=1
pkgdesc='An easy-to-use CLI interface to access the SHV network'
url='https://gitlab.com/elektroline-predator/shvcli'
arch=('any')
license=('MIT')
depends=('pyshv' 'python-prompt_toolkit')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel')
conflicts=('shvcli' 'shvcli-git')
provides=('shvcli')
source=('git+https://gitlab.com/elektroline-predator/shvcli.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_gitname"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$_gitname"
	python -m build --wheel --no-isolation
}

package() {
	cd "$srcdir/$_gitname"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
