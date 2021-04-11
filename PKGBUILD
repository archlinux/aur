# Maintainer: lmartinez-mirror
pkgname=fish-z-git
pkgver=r121.d550028
pkgrel=1
pkgdesc="Fish shell port of z, for directory jumping"
arch=('any')
url="https://github.com/jethrokuan/z"
license=('MIT')
groups=('fish-plugins')
depends=('fish')
makedepends=('git')
provides=("${pkgname%-git}" 'z')
conflicts=("${pkgname%-git}" 'z' 'zoxide')
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$pkgname"
  find conf.d functions man \
    -type f -exec install -Dm 644 '{}' "$pkgdir/etc/fish/{}" \;
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
