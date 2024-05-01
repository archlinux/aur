# Maintainer: Emma Caldeira <kiito@tilde.team>
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Ryan Coyner <rcoyner@gmail.com>

pkgname=mod_wsgi
pkgver=5.0.0
pkgrel=1
pkgdesc='Python WSGI adapter module for Apache'
arch=('x86_64')
url='http://www.modwsgi.org/'
license=('APACHE')
depends=('apache' 'python')
conflicts=('mod_wsgi2')
makedepends=('apache' 'python>=3.8')
install='mod_wsgi.install'
source=($pkgname-$pkgver.tar.gz::"https://codeload.github.com/GrahamDumpleton/mod_wsgi/tar.gz/$pkgver")
sha256sums=('013e788e26c27eeda99e235fc3ed94dc7ff8b62a0ad2fb5a1cb46aaa92f8f9cc')

build() {
  cd $pkgname-$pkgver
  ./configure \
    --prefix=/usr \
    --with-apxs=/usr/bin/apxs \
    --with-python=/usr/bin/python
  make
}

package() {
  make -C $pkgbase-$pkgver DESTDIR="$pkgdir" install
}
