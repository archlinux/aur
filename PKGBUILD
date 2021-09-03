# Maintainer :  Kr1ss $(echo \<kr1ss+x-yandex+com\>|sed s/\+/./g\;s/\-/@/)


pkgname=oneshot

pkgver=1.5.1
pkgrel=1

pkgdesc='First-come-first-serve single-fire HTTP/HTTPS server'
arch=('i686' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/raphaelreyna/$pkgname"
license=('MIT')

makedepends=('go')
depends=('glibc' 'hicolor-icon-theme')

source=("$pkgname-$pkgver.tgz::$url/archive/v$pkgver.tar.gz")
b2sums=('d4bba86763a5ac5c036323858a872ad2a5d704175657fe43a02b8cacf949e1f150f22003e63f29934e0056012551a432fae7ec6d22e1bbcab52bdbfb5199b9db')

options=('zipman')


build() {
  cd "$pkgname-$pkgver"
  go build -ldflags "-X github.com/raphaelreyna/$pkgname/cmd.version=$pkgver
                     -X github.com/raphaelreyna/$pkgname/cmd.date=$(LC_TIME=C date +"%d-%B-%Y")
                     -s
                     -w"
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "$pkgname"   -t"$pkgdir/usr/bin/"
  install -Dm644 "$pkgname.1" -t"$pkgdir/usr/share/man/man1/"
  install -Dm644 "integrations/emacs/$pkgname.el" \
                              -t"$pkgdir/usr/share/emacs/site-lisp/"
  install -Dm644 "${pkgname}_banner.png" {README,doc/md/*}.md \
                              -t"$pkgdir/usr/share/doc/$pkgname/"
  install -Dm644 icon/icon.svg  "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"
  install -Dm644 LICENSE      -t"$pkgdir/usr/share/licenses/$pkgname/"
}


# vim: ts=2 sw=2 et ft=PKGBUILD:
