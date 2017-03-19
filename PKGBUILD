pkgname=mnogosearch
pkgver=3.4.1
pkgrel=1
pkgdesc='web search engine software'
arch=('i686' 'x86_64')
url='http://www.mnogosearch.org/'
license=('GPL')
groups=()
depends=(
postgresql-libs
libmysqlclient
sqlite
unixodbc
)
makedepends=(
docbook-dsssl
# libiodbc
)
source=("$pkgname-$pkgver.tar.gz::http://www.mnogosearch.org/Download/mnogosearch-$pkgver.tar.gz")
sha256sums=('7938fdcbc68b9cb8d66319b73906c99d4fc167eb7f783499d46845f4f33519db')

build(){
  cd "$srcdir"/$pkgname-$pkgver

  CONFIGURE=(
    --prefix=/usr
    --localstatedir=/var
    --sysconfdir=/etc/mnogosearch
    --datarootdir=/usr/share/mnogosearch
    --mandir=/usr/share/man
    --with-docs
    --with-openssl
    --with-mysql
    --enable-mysql-fulltext-plugin
    --with-pgsql
#     --with-gnu-ld
    --with-zlib
    --with-readline
#     --with-chasen => chasen.h
#     --with-mecab => mecab.h
    --with-sqlite3
#     --with-sqlite
#     --with-iodbc=/usr/include/libiodbc
    --with-unixODBC
#     --with-oracle8i
  )
  ./configure ${CONFIGURE[*]}
  make
}
package(){
  cd "$srcdir"/$pkgname-$pkgver

  make DESTDIR="$pkgdir/" install
}

