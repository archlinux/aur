# Maintainer: Andrés Rodríguez <andres.rodriguez __at__ lithersoft.com>

# This package was formerly named `kivy-git` and provided `kivy`.
# As a result, this package must provide and conflict with that package.

# epoch=1 because previous version used date

pkgname=python2-kivy-git
epoch=1
pkgver=1.9.0.6186fa0
pkgrel=1
pkgdesc="A python2 module for developing multi-touch enabled media rich applications. Git version."
arch=(i686 x86_64)
url="http://kivy.org/"
license=('MIT')
source=("git://github.com/kivy/kivy.git")
depends=('python2-pygame' 'python2-opengl' 'python2-pillow'
         'gstreamer0.10-python' 'cython2-kivy' 'mtdev')
optdepends=('python2-twisted: networking framework integration')
provides=('python2-kivy' 'kivy')
conflicts=('python2-kivy' 'kivy' 'kivy-git')
replaces=('kivy-git')
md5sums=('SKIP')

_gitname=kivy

pkgver() {
    cd "$_gitname"
    git describe --tags | sed 's/-/./g'
}

build() {
    cd "$srcdir/$_gitname"
    python2 setup.py build_ext --inplace
}

package() {
    cd "$srcdir/$_gitname"
    python2 setup.py install --prefix=/usr --root="$pkgdir"

    # python2 fixes
    sed -i "s/\#\!.*python/&2/" \
      `grep -rl "\#\!.*python" "$pkgdir"`
}
