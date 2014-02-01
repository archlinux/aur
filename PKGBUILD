# $Id$
# Maintainer: Benjamin Chretien <chretien at lirmm dot fr>

pkgname=python2-mpldatacursor-git
pkgver=0.4.0.r26.g1738e4b
pkgrel=1
pkgdesc="Interactive data cursors (clickable annotation boxes) for matplotlib."
arch=('i686' 'x86_64')
url='https://github.com/joferkington/mpldatacursor'
license=('MIT')
depends=('python2-matplotlib>=0.9' 'python2-numpy>=1.1')
provides=('python2-mpldatacursor')
conflicts=('python2-mpldatacursor')

_gitroot=https://github.com/joferkington
_gitrepo=mpldatacursor

_branch=master
_dir=${_gitrepo}
source=("${_dir}"::"git+${_gitroot}/${_gitrepo}.git"#branch=${_branch})
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${_dir}"
  git describe --long | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
    cd ${srcdir}/${_dir}
    python2 setup.py build
}

package() {
    cd ${srcdir}/${_dir}
    python2 setup.py install -O1 --skip-build --root "${pkgdir}" --prefix=/usr
}
