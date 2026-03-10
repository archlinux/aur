# Maintainer: Your Name <your.email@example.com>
pkgname=terminal-love-git
pkgver=r1.1234567
pkgrel=1
pkgdesc="A terminal-based wave heart CPU/Memory monitor"
arch=('any')
url="https://github.com/kokorodonguri/terminal-love"
license=('MIT')
depends=('python')
makedepends=('git')

# 変更点1: システムに提供するコマンドを "love" と宣言し、公式の "love" と競合させる
provides=("love")
conflicts=("love")

source=('git+https://github.com/kokorodonguri/terminal-love.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/terminal-love"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/terminal-love"
  
  # 変更点2: GitHubから落としてきた "terminal-love" というファイルを、
  # インストールする時に "/usr/bin/love" という名前にリネームして配置する！
  install -Dm755 terminal-love "$pkgdir/usr/bin/love"
}
