# Contributor: Doug Newgard <scimmia at archlinux dot info>
# Contributor: fancris3 <fancris3 at aol.com>

_pkgname=places
pkgname=$_pkgname
pkgver=0.19.r197.b736f06
pkgrel=1
pkgdesc="Enlightenment module: Manage the mounting of volumes"
arch=('i686' 'x86_64')
url="https://phab.enlightenment.org/w/emodules/places/"
license=('MIT')
depends=('enlightenment<0.19.99' 'udisks')
makedepends=('git')
source=("git://git.enlightenment.org/enlightenment/modules/$_pkgname.git#branch=enlightenment-0.19")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"

  local v_ver=$(awk -F , '/^AC_INIT/ {gsub(/[\[\] -]/, ""); print $2}' configure.ac)

  printf "$v_ver.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"

  ./autogen.sh \
    --prefix=/usr \
    --disable-static

  make
}

package() {
  cd "$srcdir/$_pkgname"

  make DESTDIR="$pkgdir" install

# install text files
  install -Dm644 ChangeLog "$pkgdir/usr/share/doc/$_pkgname/ChangeLog"
  install -Dm644 NEWS "$pkgdir/usr/share/doc/$_pkgname/NEWS"
  install -Dm644 README "$pkgdir/usr/share/doc/$_pkgname/README"

# install license files
  install -Dm644 AUTHORS "$pkgdir/usr/share/licenses/$pkgname/AUTHORS"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
