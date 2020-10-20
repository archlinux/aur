# Contributor: josip <josip@jjanzic.com>
pkgname=kandoman-git
_pkgname=kandoman
pkgver=r13.1f85a49
pkgrel=1
pkgdesc="UI for todoman in form of kanban board"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'arm' 'aarch64')
url="https://github.com/janza/kandoman"
license=('MIT')
depends=('todoman' 'python-pyqt5')
source=("${pkgname%-*}::git+https://github.com/janza/kandoman.git")
sha1sums=("SKIP")

pkgver() {
    cd "$srcdir/${_pkgname}" || exit 1
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname" || exit 1
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname"
  python setup.py install --root="$pkgdir" --optimize=1
}
