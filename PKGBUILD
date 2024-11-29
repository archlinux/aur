# Maintainer: Shadow Wizard Money Gang <test@example.org>

pkgname='gmqcc-git'
pkgver='r3045.2fe0af0'
pkgrel='1'
pkgdesc='A QuakeC compiler by graphitemaster bundled with a QuakeC VM (git main branch)'
arch=('i686' 'x86_64')
url='https://github.com/graphitemaster/gmqcc'
license=('MIT')
provides=('gmqcc')
conflicts=('gmqcc')
makedepends=('git')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  make gmqcc qcvm
}

package() {
  cd "$srcdir/$pkgname"

  install -D -m755 gmqcc "$pkgdir/usr/bin/gmqcc"
  install -D -m755 qcvm "$pkgdir/usr/bin/qcvm"

  install -D -m644 AUTHORS "$pkgdir/usr/share/doc/$pkgname/AUTHORS"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  
  install -D -m644 gmqcc.ini.example "$pkgdir/usr/share/doc/$pkgname/gmqcc.ini.example"

  install -D -m644 doc/gmqcc.1 "$pkgdir/usr/share/man/man1/gmqcc.1"
  install -D -m644 doc/qcvm.1 "$pkgdir/usr/share/man/man1/qcvm.1"
}
