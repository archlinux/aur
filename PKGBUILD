# Maintainer: Thiago Perrotta <perrotta dot thiago at poli dot ufrj dot br>
# Contributor: Star Brilliant <echo bTEzMjUzQGhvdG1haWwuY29tCg== | base64 -d>

pkgname=translate-shell
pkgver=0.9.0.7
pkgrel=1
pkgdesc="Google Translate to serve as a command-line tool."
arch=('any')
url="http://www.soimort.org/$pkgname"
license=('Public Domain')
depends=('gawk>=4.0')
makedepends=('git')
optdepends=(
    'zsh: for interpreting the wrapper script'
    'fribidi: for displaying right-to-left (RTL) languages'
    'mplayer: for the Text-to-Speech functionality'
    'mpv: for the Text-to-Speech functionality'
    'mpg123: for the Text-to-Speech functionality'
    'espeak: for the Text-to-Speech functionality'
    'rlwrap: needed for readline-style editing and history in the interactive mode'
    'emacs: for using the Emacs interface (with the -E flag)'
)
install=$pkgname.install
source=("https://github.com/soimort/$pkgname/archive/v$pkgver.tar.gz")

md5sums=('43c4f39cddfdaa80ffa41835b401ed24')
sha256sums=('aa3aab12acd691b5e0177ac0dac0c246e445c085714e2ff0ad4076af342eb36b')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -dm755 "$pkgdir/usr/bin/"
  install -dm755 "$pkgdir/usr/share/man/man1"

  make "PREFIX=$pkgdir/usr" install

  # translate-shell
  ln -s "/usr/bin/trans" "$pkgdir/usr/bin/$pkgname"
  ln -s "/usr/share/man/man1/trans.1.gz" "$pkgdir/usr/share/man/man1/$pkgname.1.gz"

  # license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
