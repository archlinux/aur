# Maintainer: George Rawlinson <george@rawlinson.net.nz>

_gemname=sigdump
pkgname=ruby-$_gemname
pkgver=0.2.4
pkgrel=2
pkgdesc='Show stacktrace of Ruby processes without restarting it'
arch=(x86_64)
url='https://github.com/frsyuki/sigdump'
license=(MIT)
depends=(ruby)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
b2sums=('66c3d61eca7f1288de6d95e8d0376d27ab39fee6e5168430801d0f2016f6488eb20cc92e83967d69f690e5ff064952d2696ed08ecd0ab0c4e98c61fdfdbf38cf')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install --no-document -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
