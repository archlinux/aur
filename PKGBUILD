# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Eric Belanger <eric@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=slang-git
pkgver=2.3.2r5.gc7aa0c0
pkgrel=1
pkgdesc="S-Lang is a powerful interpreted language from git"
arch=('x86_64')
url="https://www.jedsoft.org/slang/"
license=('GPL')
depends=('pcre')
makedepends=('git')
conflicts=('slang')
provides=('slang')
backup=('etc/slsh.rc')
options=('!makeflags')
source=(git://git.jedsoft.org/git/slang.git)
sha1sums=('SKIP')
validpgpkeys=('AE962A02D29BFE4A4BB2805FDE401E0D5873000A')  # John E. Davis

pkgver() {
  cd ${pkgname%-git}
  git describe --always --long | sed 's+-+r+' | tr - . |cut -c2-
}

build() {
  cd ${pkgname%-git}
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

check() {
  cd ${pkgname%-git}
  make check || true
}

package() {
  cd ${pkgname%-git}
  make DESTDIR="${pkgdir}" install-all
}
