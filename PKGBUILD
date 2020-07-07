# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Carsten Feuls <archlinux@carstenfeuls.de>

pkgname=dovecot2-antispam-git
pkgver=2.0.r17.g713e9e9
pkgrel=1
pkgdesc="Integrates DSPAM into dovecot IMAP server. Git Version for dovecot >= 2.1"
arch=( 'i686' 'x86_64' )
url="https://git.sipsolutions.net/dovecot-antispam.git/"
license=('GPL')
depends=('dovecot>=2.2.0')
makedepends=('git')
conflicts=(dovecot-antispam)
provides=(dovecot-antispam)
source=('dovecot2-antispam-git::git+https://git.sipsolutions.net/dovecot-antispam.git')
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  # cutting off 'v' prefix that presents in the git tag
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  mkdir -p "$pkgdir/usr/lib/dovecot/modules"
  make INSTALLDIR="$pkgdir/usr/lib/dovecot/modules" install
} 
