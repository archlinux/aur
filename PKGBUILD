pkgname=python-pipewire-git
_pkgname="${pkgname%-git}"
pkgver=r147.147cb93
pkgrel=1
pkgdesc="Python controller, player and recorder via pipewire's commands"
arch=('any')
url="https://github.com/pablodz/pipewire_python"
license=('MIT')
groups=()
depends=('python')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-flit-core')
provides=("$_pkgname")
conflicts=("$_pkgname")
replaces=()
backup=()
options=()
install=
source=("$_pkgname::git+$url")
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$_pkgname"
	python -m build --wheel --no-isolation
}

package() {
	cd "$srcdir/$_pkgname"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
