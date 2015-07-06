# Maintainer: Nikolaos Bezirgiannis <bezeria@gmail.com>
# Contributor: Jeffrey Gelens <jgelens@gmail.com>
pkgname=mod_rpaf
pkgver=20140903
pkgrel=2
pkgdesc="rpaf is for backend Apache servers what mod_proxy_add_forward is for frontend Apache servers"
arch=('i686' 'x86_64')
url=('https://github.com/gnif/mod_rpaf')
source=("mod_rpaf::git://github.com/gnif/mod_rpaf#branch=stable")
arch=(i686 x86_64)
license=('apache')
depends=('apache>=2.2')
makedepends=('git' 
             'apache>=2.2')
install=$pkgname.install
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  date +%Y%m%d --date="$(git show -s --format=%cD HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  apxs -c -n mod_rpaf.so mod_rpaf.c || return 1
  mkdir -p $pkgdir/usr/lib/httpd/modules
  apxs -S LIBEXECDIR=$pkgdir/usr/lib/httpd/modules -i -n mod_rpaf.so mod_rpaf.la
}

