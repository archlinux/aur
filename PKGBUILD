# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=dontstarve
pkgver=july21
_curlver=7.23.0
pkgrel=1
pkgdesc="An open world survival video game."
group=("games")
arch=("i686" "x86_64")
url="http://www.dontstarvegame.com/"
license=('Custom')
options=(!strip)
source=("hib://${pkgname}_x64_$pkgver.tar.gz"
        "http://curl.haxx.se/download/curl-${_curlver}.tar.gz"
        "dontstarve.sh"
        "dontstarve.desktop")
md5sums=('20907561ae855bb08d919c59d18b2a82'
         '018a9acee77ed70017c6f6cec855635a'
         'f2949327f3778ffbefb68fb61c10aee7'
         'e1211feede8e6b0ce174cd56517f4689')
PKGEXT=".pkg.tar"

build() {
  cd "$srcdir/curl-${_curlver}"

  ./configure
  make
}

package() {
  cd "$srcdir/$pkgname"

  install -Dm 644 dontstarve.xpm "$pkgdir/usr/share/icons/dontstarve.xpm" 
  install -Dm 644 ../dontstarve.desktop "$pkgdir/usr/share/applications/dontstarve.desktop"

  install -dm 755 "$pkgdir/opt/dontstarve/"
  find . -type f -exec install -D {} "$pkgdir/opt/dontstarve/{}" \;

  install -dm 755 "$pkgdir/usr/bin"
  install -Dm 755 ../dontstarve.sh "$pkgdir/usr/bin/dontstarve"

  install -Dm 644 "$srcdir/curl-${_curlver}/lib/.libs/libcurl.so.4" "${pkgdir}/opt/dontstarve/bin/lib64"
}
