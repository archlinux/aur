# Maintainer  :  Kr1ss $(sed s/\+/./g\;s/\-/@/ <<<\<kr1ss+x-yandex+com\>)
# Contributor :  Chris Lahaye <dev@chrislahaye.com> (AUR package 'git-fiddle')


pkgname=git-fiddle-git

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
pkgver=r67.606086d
pkgrel=3

pkgdesc='Edit commit messages, authors, and timestamps during git-rebase'
arch=('any')
url='https://github.com/felixSchl/git-fiddle'
license=('MIT')

depends=('bash' 'git')

source=("git+https://github.com/felixSchl/${pkgname%-git}.git")
sha256sums=('SKIP')

prepare() {
  sed -i 's|^\(SCRIPT_DIR=\).*|\1/usr/lib/git-fiddle|' "${pkgname%-git}/${pkgname%-git}"
}

package() {
  cd "${pkgname%-git}"
  install -Dm755 _fiddle_seq_editor       -t"$pkgdir/usr/lib/${pkgname%-git}/"
  install -Dm755 "${pkgname%-git}"        -t"$pkgdir/usr/bin/"
  install -Dm644 "man1/${pkgname%-git}.1" -t"$pkgdir/usr/share/man/man1/"
  install -Dm644 LICENSE                  -t"$pkgdir/usr/share/licenses/${pkgname%-git}/"
}

# vim: ts=2 sw=2 et ft=PKGBUILD:
