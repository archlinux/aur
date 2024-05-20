# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Kr1ss $(echo \<kr1ss+x-yandex+com\>|sed s/\+/./g\;s/\-/@/)
pkgname=oneshot
pkgver=2.1.0
pkgrel=1
pkgdesc="First-come-first-serve single-fire HTTP/HTTPS server"
arch=(i686 x86_64 arm armv7h armv6h aarch64)
url="https://github.com/raphaelreyna/${pkgname}"
license=(MIT)
depends=(glibc hicolor-icon-theme)
makedepends=(go)
source=(${pkgname}-${pkgver}.tgz::${url}/archive/v${pkgver}.tar.gz)
b2sums=('afb40adf014cc17ec0ab686324a02fa14c41820d89e91a8a15586a7a1dc577372acb013e9eccbf667695ab613ef4f10847130582dd11eb51dd4dddbd7cc68b04')
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
