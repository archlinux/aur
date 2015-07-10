# Maintainer: anekos <anekos@snca.net>
_pkgname=cam
pkgname=$_pkgname-git
pkgver=20141220.19
pkgrel=1
pkgdesc="a unix command for viewing images"
arch=('i686' 'x86_64')
url="https://github.com/itchyny/cam"
license=('MIT')
depends=('glibc')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://github.com/itchyny/cam.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  echo "$(git log -1 --format="%cd" --date=short | sed 's|-||g').$(git rev-list --count master)"
}

build() {
  cd "$srcdir/$_pkgname"
  autoreconf -i
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir/" install

  install -Dm0644 "$srcdir/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
