# Maintainer: Mirco Tischler <mt-ml at gmx dot de>

pkgname=xdg-app
pkgver=0.4.2.1
pkgrel=1
pkgdesc='An application deployment framework for desktop apps'
arch=('i686' 'x86_64')
url='http://www.freedesktop.org/software/xdg-app'
license=('GPL2')
depends=('ostree' 'libseccomp' 'fuse')
makedepends=('git' 'docbook-xsl')
_libglnxrev='d59a63e'
install='xdg-app.install'
source=("$url/releases/$pkgname-$pkgver.tar.xz")
sha256sums=('c3dd025eda9306e8ebcca178df8a1ea3f536ddb8809b2deb8a6dc697ff075b6e')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --libexecdir=/usr/lib --sysconfdir=/etc
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install

  # remove setuid flag, instead we set CAP_SYSADMIN and CAP_MKNOD in the install script
  chmod -s "$pkgdir/usr/bin/xdg-app-helper"
}

