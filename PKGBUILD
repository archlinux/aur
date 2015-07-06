# A small web interface for xmms2 server
# Maintainer: Ivan Agarkov <ivan.agarkov@gmail.com>
pkgname=("xmms2swi")
pkgver=("0.5")
pkgrel=("1")
pkgdesc=("An XMMS2 Web Interface Client")
arch=("x86" "x86_64")
url="http://xmms2swi.sourceforge.net/"
license=("GPL")
makedepends=("patch")
depends=("xmms2" "php>=5" )
optdepends=(
  "apache: A high performance Unix-based HTTP server"
  "lighttpd: A secure, fast, compliant and very flexible web-server"
  "thttpd: Simple, small, portable, fast, and secure HTTP server"
  "nginx:  Lightweight HTTP server and IMAP/POP3 proxy server"
)
source=("http://sourceforge.net/projects/xmms2swi/files/$pkgname/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz/download"
 "nycli.conf"
 "xmms2swi-nycli.patch")
md5sums=('72947216e2ba857af272c28f077e6757'
         'c64fb15d15507ebcc71f6bd1d617ddeb'
         '913d45b5bea7ee44b1872254f9808d6b')
build() {
    cd "$pkgname"
    patch -p1 < ../xmms2swi-nycli.patch
}

package() {
    mkdir -p "$pkgdir/srv/http/xmms2swi"
    install -o http -g http -m 0644 -D nycli.conf "$pkgdir/srv/http/.config/xmms2/clients/nycli.conf"
    ( cd "$pkgname";  tar cf - . ) | (cd "$pkgdir/srv/http/xmms2swi"; tar xf -)
    chown -R http:http "$pkgdir/srv/http/xmms2swi"
}
