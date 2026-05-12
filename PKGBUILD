pkgname=eika-shell-git
_pkgname=eika-shell
pkgver=0.0.0.r69.gd2aeb9b
pkgrel=1
pkgdesc='Small Unix-like shell written in C++'
arch=('x86_64')
url='https://github.com/eika-sia/eika-shell'
license=('MIT')
depends=('glibc' 'gcc-libs')
makedepends=('git' 'cmake')
provides=('eika-shell' 'esh')
conflicts=('eika-shell')
install='eika-shell.install'
source=('git+https://github.com/eika-sia/eika-shell.git')
sha256sums=('SKIP')
options=('!debug')

pkgver() {
  cd "$srcdir/$_pkgname"

  printf "0.0.0.r%s.g%s" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

build() {
  cmake -S "$srcdir/$_pkgname" \
    -B "$srcdir/build" \
    -D CMAKE_BUILD_TYPE=Release \
    -D CMAKE_INSTALL_PREFIX=/usr

  cmake --build "$srcdir/build"
}

package() {
  install -Dm755 "$srcdir/build/shell" "$pkgdir/usr/bin/esh"

  install -Dm644 "$srcdir/$_pkgname/README.md" \
    "$pkgdir/usr/share/doc/$pkgname/README.md"

  install -Dm644 "$srcdir/$_pkgname/docs/input.md" \
    "$pkgdir/usr/share/doc/$pkgname/input.md"

  install -Dm644 "$srcdir/$_pkgname/docs/prompt.md" \
    "$pkgdir/usr/share/doc/$pkgname/prompt.md"

  install -Dm644 "$srcdir/$_pkgname/docs/language.md" \
    "$pkgdir/usr/share/doc/$pkgname/language.md"

  install -Dm644 "$srcdir/$_pkgname/docs/changelog.md" \
    "$pkgdir/usr/share/doc/$pkgname/changelog.md"

  install -Dm644 "$srcdir/$_pkgname/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
