# Maintainer: lmartinez-mirror
pkgname=fish-autopair-git
pkgver=1.0.3.r0.g1222311
pkgrel=1
pkgdesc="Auto-complete matching pairs in the Fish command line"
arch=('any')
url="https://github.com/jorgebucaran/autopair.fish"
license=('MIT')
groups=('fish-plugins')
depends=('fish')
makedepends=('git')
provides=('fish-autopair')
conflicts=('fish-pisces')
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/-/.r/;s/-/./'
}

package() {
  cd "$pkgname"
  install -Dm644 conf.d/autopair.fish "$pkgdir/etc/fish/conf.d/autopair.fish"
  find functions -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/fish/{}" \;
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE.md"
}

