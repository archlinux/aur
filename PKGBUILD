# Maintainer :  Kr1ss $(echo \<kr1ss+x-yandex+com\>|sed s/\+/./g\;s/\-/@/)
# Contributor : Aniket Pradhan <aniket17133@iiitd.ac.in>
# Contributor : Paul Irish <http://paulirish.com/>


pkgname=git-open-git
_pkgname="${pkgname%-git}"

pkgver() {
  cd "$_pkgname"
  git describe | sed 's/v\?//;s/-/.r/;s/-/./'
}
pkgver=2.1.0.r23.g14fdf5c
pkgrel=1

pkgdesc='Open a repository GitHub page or website in your browser from the shell'
arch=('x86_64')
url="https://github.com/paulirish/$_pkgname"
license=('MIT')

provides=("$_pkgname")
conflicts=('nodejs-git-open' "$_pkgname")

depends=('git' 'xdg-utils')
makedepends=('go-md2man')

options=('zipman')

changelog=changelog.md
source=("git+$url")
sha256sums=('SKIP')

prepare() {
  cd "$_pkgname"
  go-md2man <"$_pkgname.1.md" >"$_pkgname.1"
}

package() {
  cd "$_pkgname"
  install -Dm644 "$_pkgname.plugin.zsh"     -t"$pkgdir/usr/share/$_pkgname/"
  install -Dm644 "$_pkgname.1"              -t"$pkgdir/usr/share/man/man1/"
  install -Dm644 "$_pkgname.1.md" README.md -t"$pkgdir/usr/share/doc/$_pkgname/"
  install -Dm755 "$_pkgname"                -t"$pkgdir/usr/bin/"
  install -Dm644 LICENSE.md                   "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}

# vim: ts=2 sw=2 et:
