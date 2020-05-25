# Maintainer: samedamci <samedamci@disroot.org>
pkgname=tekstowo-git
pkgver=0.1.r0.54eb87b
pkgrel=1
pkgdesc="Find lyrics and translation for a song using tekstowo.pl"
arch=('any')
url="https://github.com/samedamci/tekstowo"
license=('MIT')
depends=('python3')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=("${pkgname%-git}")
source=("git+https://github.com/samedamci/${pkgname%-git}.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"

  printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g' | cut -b 2-)"
}

package() {
  cd "$srcdir/${pkgname%-git}" || exit 1
  local doc_path="$pkgdir/usr/share/doc/${pkgname%-git}"

  install -Dm755 "tekstowo.py" "$pkgdir/usr/bin/${pkgname%-git}"

  install -Dm755 -d "$pkgdir/usr/share/doc/${pkgname%-git}"

  install -Dm644 "README.md" "${doc_path}/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE"

  mkdir -p "$pkgdir/usr/share/man/man1"
  install -g 0 -o 0 -m 0644 "tekstowo.1" "$pkgdir/usr/share/man/man1/"
  gzip "$pkgdir/usr/share/man/man1/tekstowo.1"
}
