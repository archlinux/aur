# Maintainer :  Kr1ss $(echo \<kr1ss+x-yandex+com\>|sed s/\+/./g\;s/\-/@/)
# Contributor : Aniket Pradhan <aniket17133@iiitd.ac.in>
# Contributor : Paul Irish <http://paulirish.com/>

pkgname=git-open-git

pkgver() {
  cd "${pkgname%-git}"
  git describe | sed 's/v\?//;s/-/.r/;s/-/./'
}
pkgver=2.1.0.r8.g08fa2ab
pkgrel=2

pkgdesc='Type `git open` to open the GitHub page or website for a repository in your browser.'
arch=('x86_64')
url="https://github.com/paulirish/${pkgname%-git}"
license=('MIT')

provides=("${pkgname%-git}")
conflicts=('nodejs-git-open' "${pkgname%-git}")

depends=('git' 'xdg-utils')
makedepends=('go-md2man')

options=('zipman')

changelog=CHANGELOG
source=("git+$url.git")
sha256sums=('SKIP')

prepare() {
  cd "${pkgname%-git}"
  go-md2man <"${pkgname%-git}.1.md" >"${pkgname%-git}.1"
}

package() {
  cd "${pkgname%-git}"
  install -Dm755 "${pkgname%-git}" -t"$pkgdir/usr/bin/"
  install -Dm644 "${pkgname%-git}.plugin.zsh" -t"$pkgdir/usr/share/${pkgname%-git}/"
  install -Dm644 "${pkgname%-git}.1" -t"$pkgdir/usr/share/man/man1/"
  install -Dm644 "${pkgname%-git}.1.md" README.md -t"$pkgdir/usr/share/doc/${pkgname%-git}/"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE.md"
}

# vim: ts=2 sw=2 et:
