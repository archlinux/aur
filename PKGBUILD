# Maintainer: Evan Overman <evanrileyoverman@gmail.com>
# Contributer: Francesco Minnocci <ascoli dot minnocci at gmail dot com>

pkgname=python-pixcat-git
_pkgname=pixcat
pkgver=0.1.4r25.69e35c0
pkgrel=2
pkgdesc="CLI and Python API to display images on a kitty terminal with optional resizing."
arch=(any)
url='https://github.com/mirukana/pixcat'
license=('LGPL3')
depends=('python>=3.7' 'python-blessed' 'python-pillow' 'python-docopt' 'python-requests' 'python-ansiwrap')
makedepends=('python-setuptools' 'git')
provides=('pixcat' 'pixcat-git')
conflicts=('pixcat' 'pixcat-git')
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"

	# Get the version number.
	printf "0.1.4r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build(){
  cd "${srcdir}/${_pkgname}"

  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}"
  python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1 --skip-build
}
# vim:set ts=2 sw=2 et:
