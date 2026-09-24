# Maintainer: Andreas Baumann <mail@andreasbaumann.cc>
# Contributor: Aleksey Filippov <sarum9in@gmail.com>
# Contributor: Eduardo Sánchez Muñoz <eduardosanchezmunoz@gmail.com>

pkgname=cppcms
pkgver=2.0.1
pkgrel=1
pkgdesc="CppCMS is the web development framework written in C++, that is aimed on development of high performance web application."
arch=('i486' 'i686' 'pentium4' 'x86_64')
url="http://cppcms.sourceforge.net/"
license=('LGPL' 'MIT')
depends=('pcre' 'zlib' 'icu' 'python')
makedepends=('cmake' 'python')
optdepends=(
  'sqlite: Sqlite3 session storage.'
  'db: Berkeley DB session storage.'
  'cppdb: CppDB session storage.'
  'openssl'
  'gnutls'
)
conflicts=('cppcms1' 'libcppcms' 'libbooster')
provides=('libcppcms' 'libbooster')
source=("cppcms-$pkgver.tar.gz::https://github.com/artyom-beilis/cppcms/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4a7a2217b3fa59384650912a7000e016c308b4fa986a3d2562002691e5a9d6e7')

build() {
  rm -rf "$srcdir/cppcms-build"
  mkdir -p "$srcdir/cppcms-build"
  cd "$srcdir/cppcms-build"

  cmake -DCMAKE_POLICY_VERSION_MINIMUM=3.5 -DCMAKE_CXX_STANDARD=17 \
    -DCMAKE_CXX_STANDARD_REQUIRED=ON -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr "$srcdir/cppcms-$pkgver"
  make
}

package() {
  cd "$srcdir/cppcms-build"
  make DESTDIR="$pkgdir" install

  install -Dm644 "$srcdir/cppcms-$pkgver/COPYING.TXT" "$pkgdir/usr/share/licenses/$pkgname/COPYING.TXT"
  install -Dm644 "$srcdir/cppcms-$pkgver/MIT.TXT" "$pkgdir/usr/share/licenses/$pkgname/MIT.TXT"
}
