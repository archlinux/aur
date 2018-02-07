# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>

_gemname=execjs
pkgname=ruby-$_gemname
pkgver=2.7.0
pkgrel=2
pkgdesc='Run JavaScript code from Ruby'
arch=('any')
url='https://github.com/rails/execjs'
license=('MIT')
depends=('ruby')
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha512sums=('d6456bf36f4f4b3b9a3db36a5c31462c4f6ac09b02fc962b3f5c153ecec4d78acdecfb853c3255d69209e5d4342a3e485a7c59e29aded1e4065e63731e6bb16e')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/MIT-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
