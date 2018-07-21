# Maintainer: bar0metr <admin@os-admin.ru>
pkgname=squidclamav
_pkgname=squidclamav
pkgver=6.16
pkgrel=6
pkgdesc='SquidClamav is the most efficient Squid Redirector and ICAP service antivirus tool for HTTP traffic available for free'
arch=('x86_64')
url='https://github.com/darold/squidclamav.git'
provides=("$pkgname")
conflicts=("$pkgname")
source=("$pkgname::git+$url")
makedepends=('git')
depends=('c-icap' 'clamav')
license=('GPL')

sha256sums=('SKIP')

build() {
  cd "$srcdir/$_pkgname"
  chmod +x ./configure
  ./configure \
	--mandir=/usr/share/man
  make -j$(nproc)
}

package() {
  cd "$srcdir"
  make -C "$_pkgname" DESTDIR="$pkgdir" install
}


