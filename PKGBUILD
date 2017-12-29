# Maintainer: Mark Kubiak <mkubiak.dev at gmail dot com>

_gitname=wallpaper-reddit
_gitbranch=master
pkgname=${_gitname}-git
pkgver=r172.928125e
pkgrel=1
pkgdesc="Downloads and sets wallpapers pulled from reddit.com"
arch=('any')
url="https://github.com/markubiak/wallpaper-reddit"
license=('GPL3')
depends=('python' 'python-pillow')
makedepends=('git' 'python-setuptools')
provides=(${_gitname})
conflicts=(${_gitname})
source=("git+https://github.com/markubiak/${_gitname}#branch=${_gitbranch}")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_gitname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd ${_gitname}
	python3 setup.py install --root="${pkgdir}" \
	--prefix="/usr" \
	--compile -O1
	install -D LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

