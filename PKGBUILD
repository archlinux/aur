# Maintainer: Evan Overman <evanrileyoverman@gmail.com>
# Contributer: Francesco Minnocci <ascoli dot minnocci at gmail dot com>

pkgname=miniplayer-git
_pkgname=miniplayer
pkgver=1.8.1.r8.gbe25e0c
pkgrel=3
pkgdesc='A curses based mpd client with basic functionality and album art written for the Kitty terminal.'
url='https://github.com/guardkenzie/miniplayer'
depends=('python>=3.7' 'python-mpd2' 'python-pixcat-an-prata-git' 'ueberzug' 'python-colorthief')
makedepends=('git' 'python-setuptools')
provides=('miniplayer')
conflicts=('miniplayer')
license=('MIT')
arch=('any')
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build(){
	cd "${srcdir}/${_pkgname}"

  python -m build --wheel --no-isolation
}


package() {
	cd "${srcdir}/${_pkgname}"

	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
