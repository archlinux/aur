# Maintainer: Kr1ss <kr1ss.x@yandex.com>
# Contributor: Chris Lahaye <dev@chrislahaye.com> (AUR package 'git-fiddle')

pkgname=git-fiddle-git
pkgver=r67.606086d
pkgrel=2
pkgdesc='Edit commit messages, authors, and timestamps during git-rebase'
url='https://github.com/felixSchl/git-fiddle'
arch=('any')
license=('MIT')
depends=('bash' 'git')
source=("${pkgname%-git}::git+https://github.com/felixSchl/git-fiddle.git"
        'git-fiddle.patch'
        'git-fiddle.patch.sig')
sha256sums=('SKIP'
            '427f7d910811e10991e32da3b210925dc69886f8687d7464c21966955c03d056'
            'SKIP')
validpgpkeys=('7A194E3F7A8F867BEA8A5339023F078862ACFE50')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir"
  patch -p1 <git-fiddle.patch
}

package() {
  cd "$srcdir/${pkgname%-git}"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE"
  install -Dm644 "man1/${pkgname%-git}.1" "$pkgdir/usr/share/man/man1/${pkgname%-git}.1"
  install -Dm755 _fiddle_seq_editor "$pkgdir/usr/lib/${pkgname%-git}/_fiddle_seq_editor"
  install -Dm755 "${pkgname%-git}" "$pkgdir/usr/bin/${pkgname%-git}"
}
