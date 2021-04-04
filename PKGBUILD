# Maintainer: lmartinez-mirror
pkgname=fish-pure-prompt-git
pkgver=4.1.0.r4.g9d17b27
pkgrel=2
pkgdesc="Pretty, minimal, and fast prompt for Fish"
arch=('any')
url="https://github.com/pure-fish/pure"
license=('MIT')
groups=('fish-plugins')
depends=('fish>=3')
makedepends=('git')
provides=('fish-pure-prompt' 'fish-prompt')
conflicts=('fish-pure-prompt' 'fish-prompt')
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

package() {
  cd "$pkgname"
  find conf.d functions -type f -exec install -Dm 755 '{}' "$pkgdir/etc/fish/{}" \;
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
