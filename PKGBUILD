# Maintainer: Sapphira Armageddos <shadowkyogre.public@gmail.com>
# Maintainer: Albert Westra <odysseywestra@gmail.com>
# Contributor: Jon Nordby <jononor@gmail.com>
# Contributor: mosra <mosra@centrum.cz>

_basever=1.3.0.alpha
pkgname=mypaint-git
pkgver=1.3.0.alpha.r4990.c32bd422
pkgrel=1
pkgdesc="Simple drawing & painting program that works well with graphics tablets (git)."
arch=('i686' 'x86_64')
url="http://mypaint.org/"
license=('GPL2')
depends=('desktop-file-utils' 'gtk3' 'json-c' 'lcms2' 'librsvg' 'python-cairo' 'python-gobject' 'python-numpy' 'libmypaint-git')
makedepends=('git' 'swig' 'pygobject-devel' 'python' 'python-setuptools')
provides=("mypaint=${_basever}")
conflicts=('mypaint')
install=mypaint-git.install
source=('git+https://github.com/mypaint/mypaint.git'
        'mypaint-git.install')

pkgver() {
    cd "${srcdir}/mypaint"
    printf "${_basever}.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" | sed 's/^v//g;s/-/./g'
}

prepare() {
    cd "${srcdir}/mypaint"
}

build() {
    cd "${srcdir}/mypaint"
    python setup.py clean --all
    python setup.py build
}

package() {
    cd "${srcdir}/mypaint"
    echo "root: ${pkgdir}"
	
    python setup.py install \
     --root="${pkgdir}" --skip-build
}

sha256sums=('SKIP'
            '34dec9df2e005de9fae6c6352f49835a1d41e515c6131ed1df8c9e27ee3c9d1d')
