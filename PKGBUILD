# Maintainer: Tom Kuther <archlinux@kuther.net>
pkgname=nsexec-bzr
pkgver=1.22.r26
pkgrel=1
pkgdesc="Small utilitied to deal with USER_NS conversions for LXC containers"
arch=('i686' 'x86_64')
url="https://code.launchpad.net/~serge-hallyn/+junk/nsexec"
license=('GPL')
makedepends=('bzr')
source=(bzr+http://bazaar.launchpad.net/~serge-hallyn/+junk/nsexec/)
md5sums=(SKIP)

pkgver() {
  cd "$srcdir/${pkgname/-bzr/}"
  echo $(egrep '^nsexec' debian/changelog|head -n1|awk -F'[(|)]' '{print $2}').$(printf "r%s" "$(bzr revno)")
}

build() {
  cd "$srcdir/${pkgname/-bzr/}"
  make
}

package() {
  cd "$srcdir/${pkgname/-bzr/}"
  mkdir -p "$pkgdir/usr/bin"
  make DESTDIR="$pkgdir/" install
  # the manpage is .. useless
  #install -Dm644 debian/nsexec.1 "$pkgdir/usr/share/man/man1/nsexec.1"
}

# vim:set ts=2 sw=2 et:
