# Maintainer :  Kr1ss $(echo \<kr1ss+x-yandex+com\>|sed s/\+/./g\;s/\-/@/)


pkgname=dirsearch-git

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g'
}
pkgver=v0.4.1.alpha.r0.95f6e15
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
source=("git+$url.git")
sha256sums=('SKIP')


prepare() {
  cd "${pkgname%-git}"
  rm -r {logs,reports}
  sed -i 's/^# \(save-logs-home.*$\)/\1/' default.conf
}

package() {
  cd "${pkgname%-git}"
  install -dm755 "$pkgdir"/usr/{bin,{share/doc/,lib/}"${pkgname%-git}"}
  cp -a * "$pkgdir/usr/lib/${pkgname%-git}/"
  install -m644 *.md "$pkgdir/usr/share/doc/${pkgname%-git}/"
  ln -s "/usr/lib/${pkgname%-git}/${pkgname%-git}.py" "$pkgdir/usr/bin/${pkgname%-git}"
}


# vim: ts=2 sw=2 et ft=PKGBUILD:
