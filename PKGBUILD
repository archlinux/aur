# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Kr1ss $(echo \<kr1ss+x-yandex+com\>|sed s/\+/./g\;s/\-/@/)
pkgname=oneshot
pkgver=2.1.1
pkgrel=1
pkgdesc="First-come-first-serve single-fire HTTP/HTTPS server"
arch=(i686 x86_64 arm armv7h armv6h aarch64)
url="https://github.com/raphaelreyna/${pkgname}"
license=(MIT)
depends=(glibc hicolor-icon-theme)
makedepends=(go)
source=(${pkgname}-${pkgver}.tgz::${url}/archive/v${pkgver}.tar.gz)
b2sums=('fe90220042d29d4f7037ddebc0d7177c3445d1278da8758a1d862da28ec375f779d22610d47646e6f5b882c8f992ec144bb0b851e3973aa2864c28c5b773979e')
options=('zipman')

build() {
  cd ${pkgname}-${pkgver}
  go build -ldflags "-X github.com/raphaelreyna/$pkgname/cmd.version=$pkgver
                     -X github.com/raphaelreyna/$pkgname/cmd.date=$(LC_TIME=C date +"%d-%B-%Y")
                     -s
                     -w"
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm755 "$pkgname" -t "$pkgdir/usr/bin/"
  install -Dm644 "$pkgname.1" -t "$pkgdir/usr/share/man/man1/"
  install -Dm644 "integrations/emacs/$pkgname.el" -t "$pkgdir/usr/share/emacs/site-lisp/"
  install -Dm644 "${pkgname}_banner.png" {README,doc/md/*}.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -Dm644 icon/icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
