# Maintainer: Andrea <your-email@example.com>

pkgname=rog-helper
pkgver=0.1.0
pkgrel=1
pkgdesc="btop-style TUI for ASUS ROG laptop management"
arch=('any')
url="https://github.com/itsameandrea/rog-helper"
license=('MIT')
depends=(
  'ruby'
  'asusctl'
  'supergfxctl'
)
makedepends=(
  'ruby-bundler'
  'git'
)
source=("$pkgname::git+https://github.com/itsameandrea/rog-helper.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname"
  bundle config set --local deployment true
  bundle config set --local without development test
  bundle install
}

package() {
  cd "$pkgname"

  install -Dm755 "bin/rog-helper" "$pkgdir/usr/bin/rog-helper"

  install -Dm644 "lib/rog_helper.rb" "$pkgdir/usr/lib/ruby/vendor_ruby/rog_helper.rb"
  cp -r lib/rog_helper "$pkgdir/usr/lib/ruby/vendor_ruby/"

  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE" 2>/dev/null || true
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}