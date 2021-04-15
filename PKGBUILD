# Maintainer :  Kr1ss $(echo \<kr1ss+x-yandex+com\>|sed s/\+/./g\;s/\-/@/)


pkgname=oneshot

pkgver=1.5.0
pkgrel=1

pkgdesc='First-come-first-serve single-fire HTTP/HTTPS server'
arch=('i686' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/raphaelreyna/$pkgname"
license=('MIT')

makedepends=('go')
depends=('hicolor-icon-theme')

source=("$pkgname-$pkgver.tgz::$url/archive/v$pkgver.tar.gz")
b2sums=('8cd2933df1c8c001b5a577dba028e22563174e4cb758556355a96f8ce35c48d6738414b84d23e8faa4176fe5c8cd9ba648eb424408677e2ff6e53b084f63f669')

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
