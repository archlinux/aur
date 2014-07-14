# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: Giorgio Lando <patroclo7@gmail.com>
# Contributor: falconindy <d@falconindy.com>
# Maintainer: Aaron Mueller <mail@aaron-mueller.de>

pkgname=weex
pkgver=2.6.1.5
pkgrel=6
pkgdesc="A non-interactive FTP client for updating web pages"
arch=(i686 x86_64)
license=("GPL")
source=("http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz"
        "weex-2.6.1.5-formatstring.patch"
        "weex-2.6.1.5-va_list.patch")
md5sums=("c10192608ab9f715c4c1ea63cf6ad2da"
         "a12d955c5a4d6b059395a0da22942114"
         "522552e03b82ab5669fd21c558290691")
url="http://weex.sourceforge.net/"

prepare() {
  cd "$pkgname-$pkgver"

  patch -Np0 -i ../weex-$pkgver-formatstring.patch
  [[ $CARCH == x86_64 ]] && patch -Np0 -i ../weex-$pkgver-va_list.patch
}

build() {
  cd "$pkgname-$pkgver"

  # work around problems in ancient autotools installation
  unset CPPFLAGS
  CFLAGS+=' -D_FORTIFY_SOURCE=2'

  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
}
