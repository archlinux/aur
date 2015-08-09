# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Anntoin Wilkinson <anntoin gmail com>

_pkgname=python-i3
pkgname=$_pkgname-git
pkgver=r156.27f88a6
pkgrel=1
pkgdesc="Tools for i3 users and Python developers"
arch=('any')
url="https://github.com/ziberna/i3-py"
license=('GPL3')
provides=($_pkgname)
conflicts=($_pkgname)
depends=('python' 'i3-wm')
makedepends=('git')
options=(!emptydirs)
source=($pkgname::git://github.com/ziberna/i3-py.git)
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd $pkgname
  python setup.py install --root="$pkgdir/" --optimize=1

  # Install some of the useful examples
  cd examples
  for file in ipc.py scratcher.py winmenu.py wsbar.py
  do
    install -Dm 755 "$file" "$pkgdir/usr/bin/i3-${file%.py}"
  done
}

