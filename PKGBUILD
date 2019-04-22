# Maintainer: Frank Seifferth <frankseifferth@posteo.net>
# Contributor: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>

pkgname=sc-im-git
pkgver=latest
pkgrel=1
pkgdesc='A spreadsheet program based on SC'
arch=('i686' 'x86_64' 'armv7h')
url='https://github.com/andmarti1424/sc-im'
depends=(libxml2 libzip)
optdepends=('libxlsxwriter: export to xlsx')
license=('BSD')
conflicts=('scim-spreadsheet' 'sc-im')
source=('git://github.com/andmarti1424/sc-im'
        'arch.patch')
md5sums=('SKIP'
         '9a71ebf916378831bc1600d3581a126b')
MAKEFLAGS='-j1'

prepare() {
  cd "$srcdir/sc-im/src"
  # install things in the correct place for package managers
  patch < "$srcdir/arch.patch"
}

pkgver() {
  cd "$srcdir/sc-im/"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//g'
}

build() {
  cd "$srcdir/sc-im/src"
  make
}

package() {
  cd "sc-im/src"
  make DESTDIR="$pkgdir" install

  install -D -m644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
