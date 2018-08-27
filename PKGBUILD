# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=net-tools-git
pkgver=1.60.r366.gaebd88e
pkgrel=1
pkgdesc="The collection of base networking utilities for Linux"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/net-tools/"
license=('GPL2')
depends=('glibc')
makedepends=('git')
provides=('net-tools')
conflicts=('net-tools')
source=("git+https://git.code.sf.net/p/net-tools/code")
sha256sums=('SKIP')


pkgver() {
  cd "code"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "code"

  yes "" | make config
  make
}

package() {
  cd "code"

  make DESTDIR="$pkgdir" BINDIR="/usr/bin" SBINDIR="/usr/bin" install

  # provided by yp-tools
  rm "$pkgdir/usr/bin"/{nis,yp}domainname
  rm "$pkgdir/usr/share/man/man1"/{nis,yp}domainname.1

  # provided by inetutils
  rm "$pkgdir/usr/bin"/{hostname,dnsdomainname,domainname}
  rm -r "$pkgdir/usr/share/man/man1"
}
