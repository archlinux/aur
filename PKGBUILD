# Maintainer: <haagch@studi.informatik.uni-stuttgart.de>
# Based on PKGBUILD from minder <dominik at kozaczko dot info> https://aur.archlinux.org/packages/kivy-git/

pkgname=python-kivy-git
pkgver=8966.ba9df9c
pkgrel=1
pkgdesc="A python module for developing multi-touch enabled media rich applications. Git version for python3."
arch=(i686 x86_64)
url="http://kivy.org/"
license=('LGPL')
depends=('python-pygame' 'python-opengl' 'python-pillow'
         'gstreamer0.10-python' 'cython' 'mtdev')
optdepends=('twisted: networking framework integration')
provides=('python-kivy')
conflicts=('python3-kivy-git')

_gitname=kivy
source=("$_gitname::git+https://github.com/kivy/kivy.git")
md5sums=('SKIP')

build() {
  cd "$_gitname"
  python3 setup.py build_ext --inplace
}


package() {
  cd "$_gitname"
  python3 setup.py install --root="$pkgdir"
  mv "$pkgdir/usr/share/kivy-examples/" "$pkgdir/usr/share/python3-kivy-examples/"
}

pkgver() {
  cd "$_gitname"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}
