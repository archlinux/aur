# Maintainer: Anntoin Wilkinson <anntoin gmail com>
# Contributor:  willemw <willemw12@gmail.com>
pkgname=python2-i3-git
pkgver=r156.27f88a6
pkgrel=1
pkgdesc="Tools for i3 users and Python developers. Python 2 version."
arch=('any')
url="https://github.com/ziberna/i3-py"
license=('GPL3')
provides=('python2-i3')
depends=('python2' 'i3-wm')
makedepends=('git')
options=(!emptydirs)
source=('i3-py::git://github.com/ziberna/i3-py.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/i3-py"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/i3-py"
  python2 setup.py install --root="$pkgdir/" --optimize=1

  # Install some of the useful examples
  cd examples
  for file in ipc.py scratcher.py winmenu.py wsbar.py
  do
    sed -i '1 s:python:python2:' $file
    install -Dm 755 "$file" "$pkgdir/usr/bin/i3-${file%.py}2"
  done
}

# vim:set ts=2 sw=2 et:
