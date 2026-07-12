# Maintainer: Julien Virey <julien.virey+aur@gmail.com>

pkgbase=tmtv
groups=(tmtv)
pkgname=(
  tmtv
  tmtv-server
)

pkgver=2.0.2
pkgrel=1
pkgdesc='Instant terminal sharing'
arch=(x86_64 aarch64)

url='https://github.com/sa3lej/tmtv'
license=('ISC')
depends=(glibc openssl msgpack-c ncurses libbsd libssh libevent)
makedepends=(bison libutf8proc libutempter)
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver/v$pkgver.tar.gz"
  implicit-function-declaration.patch
)
sha256sums=('e297a3790ac156c3923f2373e7ed0fb50f68e428bbfced5647889772e7e85304'
            'b965e959b76d5b30e444531a556c6d693da7266fa99b0d361582acccbc356ff1')

prepare() {
  cd "$pkgname-$pkgver"
  patch --forward --strip=1 --input="${srcdir}/implicit-function-declaration.patch"
}

build() {
  cd "$pkgname-$pkgver"

  sh autogen.sh
  ./configure --enable-sixel --prefix=/usr
  make
}

package_tmtv() {
  cd "$pkgname-$pkgver"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_tmtv-server() {
  cd "$pkgbase-$pkgver"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
