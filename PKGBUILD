# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Kr1ss $(echo \<kr1ss+x-yandex+com\>|sed s/\+/./g\;s/\-/@/)
pkgname=oneshot
pkgver=2.0.2
pkgrel=1
pkgdesc="First-come-first-serve single-fire HTTP/HTTPS server"
arch=(i686 x86_64 arm armv7h armv6h aarch64)
url="https://github.com/raphaelreyna/${pkgname}"
license=(MIT)
depends=(glibc hicolor-icon-theme)
makedepends=(go)
source=(${pkgname}-${pkgver}.tgz::${url}/archive/v${pkgver}.tar.gz)
b2sums=('d64f5da3841e4016265ad6534da299af047e276bbe5597a17f4528cc2178c0cc8f1af71594594a49f3cbbc7a916399f809c4c291a1e7106364a72b95c8fa51c7')
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
