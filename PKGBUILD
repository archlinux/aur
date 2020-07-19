# Maintainer :  Kr1ss $(echo \<kr1ss+x-yandex+com\>|sed s/\+/./g\;s/\-/@/)


pkgname=oneshot

pkgver=1.1.3
pkgrel=2

pkgdesc='First-come-first-serve single-fire HTTP/HTTPS server'
arch=('i686' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/raphaelreyna/$pkgname"
license=('MIT')

makedepends=('go')

options=('zipman')

install="$pkgname.install"
source=("$url/archive/v$pkgver.tar.gz")
b2sums=('1bffc45d4cefe28362801715fc17befae74c10a06e181ed9a8175bac9ab69ed94f84b24457529c767ee9506a981b798c26c3d73259b4242646ff91c1f2c13968')


build() {
  cd "$pkgname-$pkgver"
  go build -ldflags "-X github.com/raphaelreyna/$pkgname/cmd.version=$pkgver -X github.com/raphaelreyna/$pkgname/cmd.date=$(LC_TIME=C date +"%d-%B-%Y") -s -w"
  cd doc/man && \
  go run -ldflags "-X github.com/raphaelreyna/$pkgname/cmd.version=$pkgver -X github.com/raphaelreyna/$pkgname/cmd.date=$(LC_TIME=C date +"%d-%B-%Y")" \
    ./main.go >"$pkgname.1"
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "$pkgname"                        -t"$pkgdir/usr/bin/"
  install -Dm644 "doc/man/$pkgname.1"              -t"$pkgdir/usr/share/man/man1/"
  install -Dm644 README.md "${pkgname}_banner.png" -t"$pkgdir/usr/share/doc/$pkgname/"
  install -Dm644 LICENSE                           -t"$pkgdir/usr/share/licenses/$pkgname/"
}


# vim: ts=2 sw=2 et ft=PKGBUILD:
