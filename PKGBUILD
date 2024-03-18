# Maintainer: Evan Overman <evanrileyoverman@gmail.com>
# Contributer: Francesco Minnocci <ascoli dot minnocci at gmail dot com>

pkgname=python-pixcat-git
_pkgname=pixcat
pkgver=0.1.4r25.69e35c0
pkgrel=3
pkgdesc="CLI and Python API to display images on a kitty terminal with optional resizing."
arch=(any)
url='https://github.com/mirukana/pixcat'
license=('LGPL3')
depends=('python>=3.7' 'python-blessed' 'python-pillow' 'python-docopt' 'python-requests' 'python-ansiwrap')
makedepends=('python-build' 'python-installer' 'python-wheel' 'git')
provides=('pixcat')
conflicts=('pixcat')
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"

	# Get the version number.
	printf "0.1.4r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build(){
  cd "${srcdir}/${_pkgname}"

  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_pkgname}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
# vim:set ts=2 sw=2 et:
