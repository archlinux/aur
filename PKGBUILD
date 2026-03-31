# Maintainer: rishdot <your@email.com>
pkgname=ruby-rails-metro
pkgver=0.1.0
pkgrel=1
pkgdesc="Rails app generator with CLI, TUI, and template output"
arch=(any)
url="https://railsmetro.com"
license=(MIT)
depends=(ruby)
makedepends=(rubygems)
source=("https://rubygems.org/downloads/rails-metro-$pkgver.gem")
noextract=("rails-metro-$pkgver.gem")
sha256sums=('44604c7dc34aa9b28db7e4ae8db883593bcc8b7fa4998636d969992dca1a6f16')

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
