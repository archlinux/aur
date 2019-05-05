# Maintainer: Mario Finelli <mario at finel dot li>

pkgname=puppet-lint
pkgver=2.3.6
pkgrel=1
pkgdesc="Check that your Puppet manifests conform to the style guide."
arch=(any)
url="https://github.com/rodjek/puppet-lint"
license=('MIT')
depends=('ruby')
makedepends=('rubygems' 'ruby-rdoc')
source=(https://rubygems.org/downloads/$pkgname-$pkgver.gem)
noextract=($pkgname-$pkgver.gem)
sha256sums=('3a4e0bb19eca582cd2a37dac6f45c417cf50ac28f988d087be2635400815d3f3')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install \
    --ignore-dependencies \
    --no-user-install \
    -i "$pkgdir/$_gemdir" \
    -n "$pkgdir/usr/bin" \
    $pkgname-$pkgver.gem

  rm "$pkgdir/$_gemdir/cache/$pkgname-$pkgver.gem"

  install -Dm0644 "$pkgdir/$_gemdir/gems/$pkgname-$pkgver/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
