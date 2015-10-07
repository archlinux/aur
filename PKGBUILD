# Maintainer: Mirco Tischler <mt-ml at gmx dot de>

pkgname=xdg-app
pkgver=0.4.4
pkgrel=2
pkgdesc='An application deployment framework for desktop apps'
arch=('i686' 'x86_64')
url='http://www.freedesktop.org/software/xdg-app'
license=('GPL2')
depends=('ostree' 'libseccomp' 'fuse' 'libxau')
makedepends=('git' 'docbook-xsl')
_libglnxrev='d59a63e'
install='xdg-app.install'
source=("$url/releases/$pkgname-$pkgver.tar.xz")
sha256sums=('d672bc83ad618c89b10b9234188c166efd58f8e0fa4095bd25a1a732696525a5')

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

