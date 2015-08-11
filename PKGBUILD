# Maintainer:  TDY <tdy@archlinux.info>
# Contributor: Dave Pernu <u.owned@gmail.com>
# Contributor: Firmicus <francois.archlinux.org>

pkgname=apparix
pkgver=11.062
pkgrel=2
pkgdesc="A command line file browser with bookmark support"
arch=('i686' 'x86_64')
url="http://micans.org/apparix/"
license=('GPL2')
depends=('glibc')
options=('!docs' 'zipman')
source=(http://micans.org/$pkgname/src/$pkgname-${pkgver/./-}.tar.gz
        apparix.sh)
sha256sums=('211bb5f67b32ba7c3e044a13e4e79eb998ca017538e9f4b06bc92d5953615235'
            '731210a83707fa264510d108e210f29f8b198444bf0a7152087e71007d0658b2')

build() {
  cd "$srcdir/$pkgname-${pkgver/./-}"
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd "$srcdir/$pkgname-${pkgver/./-}"
  make DESTDIR="$pkgdir/" install
  install -Dm755 ../$pkgname.sh "$pkgdir/etc/profile.d/$pkgname.sh"
}

# vim:set ts=2 sw=2 et:
