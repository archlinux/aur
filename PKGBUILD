# Maintainer: ZhX589 ZhX589@outlook.com
pkgname=organize-git
pkgver=2.0.4
pkgrel=1
pkgdesc="File organizer by extension - Git version"
arch=('any')
url="https://github.com/ZhX589/organize"
license=('MIT')
depends=('bash' 'coreutils')
makedepends=('git' 'make')
provides=("organize")
conflicts=("organize" "organize-bin")
source=("$pkgname::git+https://github.com/ZhX589/organize.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$pkgname"
  
  # 运行 make 构建（生成最终的 organize.sh）
  make
  
  # 安装
  install -Dm755 build/organize.sh "$pkgdir/usr/bin/organize"
  install -Dm644 config/rules.conf.example "$pkgdir/usr/share/organize/rules.conf.default"
  install -Dm644 man/organize.1 "$pkgdir/usr/share/man/man1/organize.1"
}
