# Maintainer: Nidhogg

pkgname=monkeysphere-git
_gitname=monkeysphere
pkgver=20150505
pkgrel=1
pkgdesc="Leverage the OpenPGP web of trust for OpenSSH and Web authentication"
arch=(any)
url="http://web.monkeysphere.info/"
license=('GPL3')
depends=(gnupg lockfile-progs perl-crypt-openssl-rsa perl-digest-sha1 netcat)
provides=(monkeysphere)
conflicts=(monkeysphere)
source=(git://git.monkeysphere.info/${_gitname})
install=monkeysphere.install
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  git log -1 --format=%cd --date=short | sed 's/-//g'
}

build() {
  cd "$srcdir/$_gitname"
  make
} 

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir/" install
  mv $pkgdir/usr/sbin/* $pkgdir/usr/bin/
  rmdir $pkgdir/usr/sbin/
  mkdir -p $pkgdir/var/lib/monkeysphere
}
