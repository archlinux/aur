# Maintainer :  Kr1ss $(echo \<kr1ss+x-yandex+com\>|sed s/\+/./g\;s/\-/@/)


pkgname=dirsearch-git

pkgver() { git -C "${pkgname%-git}" describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'; }
pkgver=0.4.1.alpha.r127.d2d3050
pkgrel=1

pkgdesc='Web path scanner/fuzzer, written in Python'
arch=('any')
url="https://github.com/maurosoria/${pkgname%-git}"
license=('GPL2')

provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")

depends=('python')
makedepends=('git')

changelog=CHANGELOG.md
backup=("usr/lib/${pkgname%-git}/default.conf")
source=("git+$url.git")
sha256sums=('SKIP')


prepare() {
  cd "${pkgname%-git}"
  rm -r {logs,reports}
  sed -i 's/^\(save-logs-home\s*=\s*\)False/\1True/' default.conf
}

package() {
  cd "${pkgname%-git}"
  install -dm755 "$pkgdir/usr"/{bin,"lib/${pkgname%-git}"}
  cp -a --no-preserve=o db lib thirdparty default.conf dirsearch.py "$pkgdir/usr/lib/${pkgname%-git}/"
  install -Dm644 *.md -t"$pkgdir/usr/share/doc/${pkgname%-git}/"
  ln -s "/usr/lib/${pkgname%-git}/${pkgname%-git}.py" "$pkgdir/usr/bin/${pkgname%-git}"
}


# vim: ts=2 sw=2 et ft=PKGBUILD:
