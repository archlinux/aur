# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=cosmic-icons-git
pkgver=1.0.0.alpha.1.r0.gf93dcdf
pkgrel=1
pkgdesc="System76 Cosmic icon theme"
arch=('any')
url="https://github.com/pop-os/cosmic-icons"
license=('CC-BY-SA-4.0 AND GPL-3.0-or-later')
depends=('pop-icon-theme-git')
makedepends=('git' 'just')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=('!strip')
source=('git+https://github.com/pop-os/cosmic-icons.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags --abbrev=7 | sed 's/^epoch-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${pkgname%-git}"
  just rootdir="$pkgdir" install

  install -Dm644 COPYING LICENSE -t "$pkgdir/usr/share/licenses/${pkgname%-git}/"
}
