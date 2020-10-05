# Maintainer: Adrien Wu <adrien.sf.wu@gmail.com>
pkgname=nppcrypt
pkgver=1.0.1.6
pkgrel=3
pkgdesc="Cryptography plugin from Nodepad++"
url="https://github.com/jeanpaulrichter/nppcrypt"
arch=('i686' 'x86_64')
provides=('nppcrypt')
source=('https://github.com/jeanpaulrichter/nppcrypt/archive/1.0.1.6.zip')
sha256sums=('7f74192269ba70683cad15c49634090efc1ffeb4fdcd249e5f86a213f85928b2')

build() {
  cd "$srcdir/nppcrypt-1.0.1.6"
  find src -type f -print0 | xargs -0 sed -i \
      's/\(^\|[^a-zA-Z0-9_]\)crypt::/\1nppcrypt::/g; s/namespace crypt/namespace nppcrypt/g'
  sed -i 's/^all:.*/all:/g; s/@make/$(MAKE)/g; 11 a unexport LDFLAGS' GNUmakefile
  sed -i '35 a \\t$(MAKE) info\n\t$(MAKE) directories\n\t$(MAKE) $(CRYPTOPP)\n\t$(MAKE) bin/$(SUBDIR)/$(TARGET)' GNUmakefile
  make
}

package() {
  install -D -m755 "$srcdir/nppcrypt-1.0.1.6/bin/release/nppcrypt" "${pkgdir}/usr/bin/nppcrypt"
}
