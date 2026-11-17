# Maintainer : KokaKiwi <kokakiwi+aur at kokakiwi dot net>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=php-wikidiff2
pkgver=1.14.2
pkgrel=1
pkgdesc="A PHP module that provides the external diff engine for MediaWiki"
arch=('i686' 'x86_64')
license=('GPL-2.0-or-later')
url='https://www.mediawiki.org/wiki/Extension:Wikidiff2'
depends=('php' 'libthai')
source=("https://releases.wikimedia.org/wikidiff2/wikidiff2-$pkgver.tar.gz"{,.sig})
sha512sums=('f8bb46e7e819b8795e81deaf4b5b447da8b5523c11554aa464de671cfc10f49703b9e1ee49edf9756fab4c9f90bb614d913f8f03a4a521028ecf4099082ccdb7'
            'SKIP')
validpgpkeys=(
  'F64EBF5F20996AB514F198A873F146FECF9D333C'  # Tim Starling <tstarling@wikimedia.org>
)

build() {
  cd "wikidiff2-$pkgver"

  phpize
  ./configure --prefix=/usr

  make
}

package() {
  cd "wikidiff2-$pkgver"

  make install INSTALL_ROOT="$pkgdir"

  install -dm0755 "$pkgdir/etc/php/conf.d"
  echo "extension=wikidiff2.so" > "$pkgdir/etc/php/conf.d/wikidiff2.ini"

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" COPYING
}
