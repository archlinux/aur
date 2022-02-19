# Maintainer: Thiago Perrotta <perrotta dot thiago at poli dot ufrj dot br>
# Contributor: Lucas Sampaio <lucas@lsmagalhaes.com>
# Contributor: Quan Guo <guotsuan@gmail.com>

pkgname=fpp-git
pkgver=0.9.5.r0.g3670d02
pkgrel=1
pkgdesc='TUI that lets you pick paths out of its stdin and run arbitrary commands on them'
url='https://facebook.github.io/PathPicker'
license=('MIT')
source=("${pkgname%-git}::git+https://github.com/facebook/PathPicker.git")
sha256sums=('SKIP')
arch=('any')
makedepends=('git')
depends=('python')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")

prepare() {
  cd "$srcdir/${pkgname%-git}"
  rm -r "src/tests"
}

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/${pkgname%-git}"

  # library
  install -Dm755 "fpp" -t "$pkgdir/usr/share/fpp"
  cp -a src "$pkgdir/usr/share/fpp"

  # entrypoint
  install -dm755 "$pkgdir/usr/bin"
  ln -s "/usr/share/fpp/fpp" "$pkgdir/usr/bin"

  # documentation
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 "debian/usr/share/man/man1/fpp.1" -t "$pkgdir/usr/share/man/man1"
}
