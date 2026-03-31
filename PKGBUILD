# Maintainer: rishdot <your@email.com>
pkgname=ruby-rails-metro
pkgver=0.2.0
pkgrel=1
pkgdesc="Rails app generator with CLI, TUI, and template output"
arch=(any)
url="https://railsmetro.com"
license=(MIT)
depends=(ruby)
makedepends=(rubygems)
source=("https://rubygems.org/downloads/rails-metro-$pkgver.gem")
noextract=("rails-metro-$pkgver.gem")
sha256sums=('16d925b78500646fb89db4e5b271d4d3feb21477f89bf562eb8cf01f40e0e3a4')

package() {
  local _gemdir
  _gemdir="$(ruby -e 'puts Gem.default_dir')"

  gem install \
    --ignore-dependencies \
    --no-user-install \
    --install-dir "$pkgdir/$_gemdir" \
    --bindir "$pkgdir/usr/bin" \
    "rails-metro-$pkgver.gem"

  # Remove unnecessary files
  rm -rf "$pkgdir/$_gemdir/cache"

  install -Dm644 "$pkgdir/$_gemdir/gems/rails-metro-$pkgver/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
