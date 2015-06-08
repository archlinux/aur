# Maintainer: Antoine Pierlot-Garcin <antoine@bokbox.com>

pkgname=luasec-hg
pkgver=45.5be249c0ae71
pkgrel=2
pkgdesc='Lua bindings for OpenSSL library to provide TLS/SSL communication.'
arch=('i686' 'x86_64')
provides=('luasec')
conflicts=('luasec')
url="http://code.matthewwild.co.uk/$pkgname"
license=('MIT')
depends=('openssl>=0.9.7' 'lua51' 'lua51-socket>=2.0.2')
source=('luasec-hg::hg+http://code.matthewwild.co.uk/luasec-hg'
        'luasec.patch')
md5sums=('SKIP'
'210496f81708daf79c799ceecd168391')

pkgver() {
  cd "$srcdir"/luasec-hg
  echo $(hg identify -n).$(hg identify -i)
}

build() {
  cd "$srcdir"/luasec-hg

  patch -p1 Makefile ../luasec.patch
  make linux
}

package() {
  install -d "$pkgdir/usr/share/lua/5.1"
  install -d "$pkgdir/usr/lib/lua/5.1"
  install -d "$pkgdir/usr/share/licenses/$pkgname"

  cd "$srcdir"/luasec-hg
  make DESTDIR="$pkgdir/" install

  install -m644 "LICENSE" "$pkgdir/usr/share/licenses/luasec-hg/LICENSE"
}
