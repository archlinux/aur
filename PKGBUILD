pkgbase=python-svg2mod-git
pkgname=('python-svg2mod-git' 'python2-svg2mod-git')
_module='svg2mod'
pkgver=r55.0b7103b
pkgrel=1
pkgdesc="Convert Inkscape SVG drawings to KiCad footprint modules"
url="https://github.com/mtl/svg2mod"
depends=()
makedepends=('python-setuptools' 'python2-setuptools')
license=('Creative Commons Zero v1.0 Universal')
arch=('any')
source=("git://github.com/mtl/svg2mod.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_module"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  cp -a "${srcdir}/${_module}"{,-python2}
}

build() {
    cd "${srcdir}/${_module}"
    python setup.py build

    cd "${srcdir}/${_module}-python2"
    python2 setup.py build
}

package_python-svg2mod-git() {
    depends+=('python')
    cd "${srcdir}/${_module}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

package_python2-svg2mod-git() {
    depends+=('python2')
    cd "${srcdir}/${_module}-python2"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

