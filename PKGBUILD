# Maintainer: D. Murphy (archerdm)

pkgname=netns-exec
pkgver=r4.aa346fd
pkgrel=1
pkgdesc="SetUID program which allows users to run applications in a network namespace."
arch=('x86_64')
url="https://github.com/pekman/netns-exec"
license=('GPL2')
depends=('glibc')
source=("git+https://github.com/pekman/netns-exec.git"
        "git+https://git.kernel.org/pub/scm/network/iproute2/iproute2.git")
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname"
  rmdir iproute2 && ln -s ../iproute2 ./
  make
}

package() {
  mkdir -p $pkgdir/usr/bin
  install -Dm4755 $srcdir/$pkgname/netns-exec $pkgdir/usr/bin/
  install -Dm755 $srcdir/$pkgname/netns-exec-dbus $pkgdir/usr/bin/
}
