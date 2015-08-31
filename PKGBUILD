pkgname=stardict-tools
pkgver=3.0.1
pkgrel=1
pkgdesc='Stardict tools'
arch=('i686' 'x86_64')
url='http://code.google.com/p/stardict-3'
license=('GPLv3')
depends=('gtk2' 'glib2')
makedepends=('intltool' 'libtool' 'libmysqlclient')

source=("https://stardict-3.googlecode.com/files/$pkgname-$pkgver.tar.bz2"
    'fix-compilation.patch'
    'fix-lz-linking.patch'
    'fix-typo.patch'
    'fix-zlib.patch')

build()
{
    cd "$srcdir/${pkgname}-$pkgver"

    patch -p1 < ../fix-compilation.patch
    patch -p1 < ../fix-lz-linking.patch
    patch -p1 < ../fix-typo.patch
    patch -p1 < ../fix-zlib.patch

    ./autogen.sh --prefix=/usr
    make
}

package() {
    cd "$srcdir/${pkgname}-$pkgver"
    make DESTDIR="$pkgdir" install
}
md5sums=('177c2c7b963669ed657c46d915e08c02'
    'dd55902a93e7c8cd4dcddc2efb407c57'
    '9d2312c00edb6abbc38a5a7e8fa866db'
    'cfc5af4ed3cee7df637da641f19fa5f5'
    'f936a9d742b19a4fd29b94e55f0baf97')
