# Maintainer: Sapphira Armageddos <shadowkyogre.public@gmail.com>
# Maintainer: Albert Westra <odysseywestra@gmail.com>
# Contributor: Jon Nordby <jononor@gmail.com>
# Contributor: mosra <mosra@centrum.cz>

_pkgverbase=1.3.0
pkgname=mypaint-git
pkgver=1.3.0.alpha+git.922f73df
pkgrel=1
pkgdesc="Simple drawing & painting program that works well with graphics tablets (git)."
arch=('i686' 'x86_64')
url="http://mypaint.org/"
license=('GPL2')
depends=('desktop-file-utils' 'gtk3' 'json-c' 'lcms2' 'librsvg' 'python2-cairo' 'python2-gobject' 'python2-numpy' 'libmypaint-git')
makedepends=('git' 'swig' 'pygobject-devel' 'python2' 'python2-setuptools')
provides=("mypaint=${pkgver}")
conflicts=('mypaint')
install=mypaint-git.install
source=('git+https://github.com/mypaint/mypaint.git'
        'mypaint-git.install')

pkgver() {
    cd "${srcdir}/mypaint"
    eval `python2 lib/meta.py`
    echo "$MYPAINT_VERSION_CEREMONIAL" \
    | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' \
    | sed 's/gitexport/git/g'
}

prepare() {
    cd "${srcdir}/mypaint"
    
}

build() {
    cd "${srcdir}/mypaint"
    python2 setup.py clean --all
    python2 setup.py build
}

package() {
    cd "${srcdir}/mypaint"
    echo "root: ${pkgdir}"
	
    python2 setup.py install \
     --root="${pkgdir}" --skip-build
}

sha256sums=('SKIP'
            '34dec9df2e005de9fae6c6352f49835a1d41e515c6131ed1df8c9e27ee3c9d1d')
