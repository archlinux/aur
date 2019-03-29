# Maintainer: LinRs <20455421+LinRs AT users.noreply.github.com>
# Contributor: Pierre Neidhardt <ambrevar@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Ben Mazer <blm@groknil.org>
# Contributor: Mike Douglas <code_monkey@gooeylinux.org>

pkgname=gtypist
pkgver=2.9.5
pkgrel=6
pkgdesc="universal typing tutor"
arch=('x86_64')
url="http://www.gnu.org/software/gtypist/gtypist.html"
license=("GPL3")
depends=('ncurses' 'perl')
makedepends=('emacs')
source=("https://ftp.gnu.org/gnu/gtypist/$pkgname-$pkgver.tar.gz"{,.sig}
	ncurses.patch)
sha256sums=('4059be9585683bbb84757dd4bbafa8ff4ecda2ed9eecd4e7594365843f05a266'
            'SKIP'
            'c4d7b942aafb2e9262683083662328f770565ce71c0ca11d3e99065a60925945')
validpgpkeys=("F8F09C0B79F90A20F953FB1CA6D813D8C94AFA52") #Tim Marston <edam@waxworlds.org>
prepare() {
  cd "$srcdir"/$pkgname-$pkgver
  patch -p1 <"$srcdir"/ncurses.patch
  autoreconf
}

build() {
  cd "$srcdir"/$pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  make prefix="$pkgdir"/usr install
  rm -f "$pkgdir"/usr/share/info/dir
}
