# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=cosmic-icons-git
pkgver=r9.14d8e20
pkgrel=1
pkgdesc="System76 Cosmic icon theme"
arch=('any')
url="https://github.com/pop-os/cosmic-icons"
license=('CC-BY-SA-4.0')
depends=('gtk-update-icon-cache')
makedepends=('git' 'just')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/pop-os/cosmic-icons.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/${pkgname%-git}"
  just rootdir="$pkgdir" install

  install -Dm644 COPYING LICENSE -t "$pkgdir/usr/share/licenses/${pkgname%-git}/"
}
