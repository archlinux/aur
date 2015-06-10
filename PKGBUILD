# Maintainer: Kevin MacMartin <prurigro at gmail dot com>

_pkgname=tasksh
pkgname=$_pkgname-git
pkgver=20141222.r62.c5e6d77
pkgrel=1
pkgdesc='A shell command that wraps Taskwarrior commands'
url='http://tasktools.org/projects/tasksh.html'
license=('MIT')
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
depends=('task')
makedepends=('git' 'cmake')
source=("git+https://git.tasktools.org/scm/ex/tasksh.git")
sha512sums=('SKIP')

pkgver() {
  cd $_pkgname
  printf "%s.r%s.%s" "$(git show -s --format=%ci master | sed 's/\ .*//g;s/-//g')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $_pkgname
  cmake . -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd $_pkgname
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
