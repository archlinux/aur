# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Anntoin Wilkinson <anntoin gmail com>

_pkgname=python-i3
_pkgname2=python2-i3
pkgbase=$_pkgname-git
pkgname=($_pkgname-git $_pkgname2-git)
pkgver=r156.27f88a6
pkgrel=3
pkgdesc="Tools for i3 users and Python developers"
arch=('any')
url="https://github.com/ziberna/i3-py"
license=('GPL3')
makedepends=('git' 'python' 'python2')
options=(!emptydirs)
source=($_pkgname::git://github.com/ziberna/i3-py.git)
md5sums=('SKIP')

pkgver() {
  cd $_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  rm -rf $_pkgname2
  cp -a $_pkgname $_pkgname2
}

#build() {
#  cd "$srcdir/$_pkgname"
#  python setup.py build
#
#  cd "$srcdir/$_pkgname2"
#  python2 setup.py build
#}

package_python-i3-git() {
  provides=($_pkgname)
  conflicts=($_pkgname)
  depends=('python' 'i3-wm')

  cd $_pkgname
  python setup.py install --root="$pkgdir/" --optimize=1

  # Install some of the useful examples
  cd examples
  for file in ipc.py scratcher.py winmenu.py wsbar.py
  do
    install -Dm755 "$file" "$pkgdir/usr/bin/i3-${file%.py}"
  done
}

package_python2-i3-git() {
  provides=($_pkgname2)
  conflicts=($_pkgname2)
  depends=('python2' 'i3-wm')

  cd $_pkgname2
  python2 setup.py install --root="$pkgdir/" --optimize=1

  # Install some of the useful examples
  cd examples
  for file in ipc.py scratcher.py winmenu.py wsbar.py
  do
    install -Dm755 "$file" "$pkgdir/usr/bin/i3-${file%.py}2"
  done
}

