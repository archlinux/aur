# Maintainer: Ryan Yuan <ryanyuanzhehan@gmail.com>
# Contributor: 漓翎_cub <1534183068@qq.com>
pkgname=hei-cursors-bin
pkgver=2.0
pkgrel=2
pkgdesc="Hei Cursor Theme. Created by Bilibili user 1013625945 (漓翎_cub), ported by GitHub user Tseshongfeeshur (Ryan)."
arch=('any')
url="https://github.com/Tseshongfeeshur/hei-cursors"
license=('MIT')
depends=()
makedepends=('curl' 'jq')   # 用于动态获取最新 release
provides=("${pkgname}")
conflicts=("${pkgname}-git")

source=("hei-cursors.tar.gz::https://github.com/Tseshongfeeshur/hei-cursors/releases/latest/download/hei-cursors.tar.gz")

sha256sums=('SKIP')

pkgver() {
  curl -s "https://api.github.com/repos/Tseshongfeeshur/hei-cursors/releases/latest" | jq -r '.tag_name' | sed 's/^v//'
}

prepare() {
  cd "$srcdir"
}

package() {
  cd "$srcdir"
  tar -xzf hei-cursors.tar.gz

  install -dm755 "$pkgdir/usr/share/icons/hei_cursors"
  cp -r ./* "$pkgdir/usr/share/icons/hei_cursors/"

  # 确保权限正确
  find "$pkgdir/usr/share/icons/hei_cursors" -type d -exec chmod 755 {} \;
  find "$pkgdir/usr/share/icons/hei_cursors" -type f -exec chmod 644 {} \;
}
