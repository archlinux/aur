# Maintainer: Lars Hagström <lars@teg>
pkgname=open-zwave-control-panel-git
pkgver=r77.2bfa075
pkgrel=1
pkgdesc="TODO"
arch=(any)
url="https://github.com/OpenZWave/open-zwave-control-panel"
license=(TODO)
groups=()
depends=("libmicrohttpd" "openzwave-git" "gnutls")
makedepends=()
backup=()
options=()
install=
source=("$pkgname"::"git+https://github.com/OpenZWave/open-zwave-control-panel.git"
	"open-zwave"::"git+https://github.com/OpenZWave/open-zwave.git"
	"Makefile"
        "open-zwave-control-panel.service")
sha1sums=('SKIP'
          'SKIP'
          'cf11c507c2f70ade84df23907e37c2454f1df99a'
          '60cf35ece5593cfb6b48ffc17e8391a0e8d032ae')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cp Makefile "$srcdir/$pkgname"
  cd "$srcdir/$pkgname"
  make

  install -d -m 755 $pkgdir/usr/bin
  install ozwcp $pkgdir/usr/bin

  install -d -m 755 $pkgdir/usr/share/open-zwave-control-panel/
  install -m 644 *.html $pkgdir/usr/share/open-zwave-control-panel/
  install -m 644 *.js $pkgdir/usr/share/open-zwave-control-panel/

  install -d -m 755 $pkgdir/usr/lib/systemd/user/
  install -m 644 $srcdir/open-zwave-control-panel.service $pkgdir/usr/lib/systemd/user/
}

