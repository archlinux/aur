# Maintainer: Xavier Francisco <echo moc.liamg@ocsicnarf.n.reivax | rev>

pkgname=heytmux
pkgver=0.3.0
pkgrel=1
pkgdesc="Tmux scripting made easy"
arch=('any')
url="https://github.com/junegunn/heytmux"
license=('MIT')
depends=('ruby' 'tmux')
makedepends=('rubygems')
source=("$pkgname-$pkgver.tar.gz::https://github.com/junegunn/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('85bde16c6d657e20422eea0ea0016efbc2a15ce34b83cf20017358385cb3751f')

build() {
  cd "$pkgname-$pkgver"
  gem build heytmux.gemspec
}

package() {
  cd "$pkgname-$pkgver"
  local _gemdir="$(ruby -e 'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install \
    -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" \
    "$pkgname-$pkgver.gem"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  rm -rf "$pkgdir/$_gemdir/cache"
}
