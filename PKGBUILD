# Maintainer: Valentijn V. <deepnavy at waifu dot club>
# Contributor: Alastair Feille <me at alastair dot se>

pkgname=wget-lua
pkgver=1.14
pkgrel=3
pkgdesc="Wget with Lua scripting"
url="http://archiveteam.org/index.php?title=Wget_with_Lua_hooks"
license=('GPL')
depends=('gnutls' 'libidn' 'pcre' 'lua')
optdepends=("ca-certificates: HTTPS Downloads")
makedepends=('git' 'perl')
provides=('wget-lua')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
source=("http://warriorhq.archiveteam.org/downloads/wget-lua/wget-1.14.lua.LATEST.tar.bz2"
        "lua.patch"
        "ssl.patch")
sha1sums=('3fdc939d7b66c5f0fa0bf00b366ec01a4b306afa'
          '3f9d9f483fb0435624faa8d51e7171b11b3542cb'
          '7e06d0272f90325c46b4ef609dce7c471342f077')
build() {
  cd "$srcdir"/wget-1.14.lua.20*/
  patch -p0 -i $srcdir/lua.patch
  patch -p0 -i $srcdir/ssl.patch

  ./configure --with-ssl=gnutls --disable-nls
  make
}

package() {
  cd "$srcdir"/wget-1.14.lua.20*/src
  mkdir -p "$pkgdir/usr/bin/"
  cp wget "$pkgdir/usr/bin/wget-lua"
}

