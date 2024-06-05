# Contributor: Aaron Fischer <mail@aaron-fischer.net>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: Giorgio Lando <patroclo7@gmail.com>
# Contributor: falconindy <d@falconindy.com>

pkgname=weex
pkgver=2.8.3
pkgrel=1
pkgdesc="non-interactive FTP client for updating web pages"
arch=(i686 x86_64)
license=("GPL")
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname/weex_$pkgver.tar.gz"
        "weex-va_list.patch")
md5sums=('f39058321854ebfe01594cc7431ddeec'
         '522552e03b82ab5669fd21c558290691')
url="http://weex.sourceforge.net/"

prepare() {
  cd "$pkgname-$pkgver"

  [[ $CARCH == x86_64 ]] && patch -Np0 -i ../weex-va_list.patch
  autoupdate
  #autoreconf -fi
}

build() {
  cd "$pkgname-$pkgver"

  # work around problems in ancient autotools installation
  unset CPPFLAGS
  CFLAGS+=' -D_FORTIFY_SOURCE=2'

  ./configure --prefix=/usr --build=x86_64-unknown-linux-gnu --disable-dependency-tracking
  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
}
