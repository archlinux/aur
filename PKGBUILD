# Maintainer: josip <me@josip.dev>
pkgname=dibi-git
_pkgname=dibi
pkgver=r12.2baa1f0
pkgrel=1
pkgdesc="Lightweight GUI for MySQL with performance in mind"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'arm' 'aarch64')
url="https://github.com/janza/dibi"
license=('GPL3')
depends=('python-mysqlclient' 'python-pyqt5' 'python-sshtunnel')
source=("${pkgname%-*}::git+https://github.com/janza/dibi.git")
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
