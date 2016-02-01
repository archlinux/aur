# Maintainer: Mirco Tischler <mt-ml at gmx dot de>

pkgname=xdg-app
pkgver=0.4.8
pkgrel=1
pkgdesc='An application deployment framework for desktop apps'
arch=('i686' 'x86_64')
url='http://www.freedesktop.org/software/xdg-app'
license=('GPL2')
depends=('ostree' 'libseccomp' 'fuse' 'libxau' 'json-glib' 'libelf')
makedepends=('git' 'docbook-xsl')
_libglnxrev='d59a63e'
install='xdg-app.install'
source=("$url/releases/$pkgname-$pkgver.tar.xz")
sha256sums=('1fbaf858a969ab8d8bd34842307722fddc4601f4bd8aebccb656dce62c409075')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --libexecdir=/usr/lib --sysconfdir=/etc --disable-userns
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

