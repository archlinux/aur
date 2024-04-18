# Maintainer: acd407 <acd407@qq.com>
# Maintainer: masutu <masutu dot arch at gmail dot com>
# Contributor: masutu <masutu dot arch at gmail dot com>

pkgname=pyfluidsynth-git
_pkgname=pyfluidsynth
pkgver=r66.98b22fb
pkgrel=1
pkgdesc="Python bindings for FluidSynth"
arch=('any')
url="http://code.google.com/p/pyfluidsynth"
license=('LGPL')
depends=('fluidsynth')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}"::"git+https://github.com/nwhitehead/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$_pkgname"
    python setup.py bdist_wheel
}

package() {
	cd "$_pkgname"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
