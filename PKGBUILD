# Maintainer: kmille <github@androidloves.me>
# Maintainer: Mario Finelli <mario at finel dot li>

pkgname=puppet-lint
pkgver=5.1.0
pkgrel=1
pkgdesc="Check that your Puppet manifests conform to the style guide."
arch=(any)
url="https://github.com/puppetlabs/puppet-lint"
license=('MIT')
depends=('ruby')
makedepends=('rubygems' 'ruby-rdoc')
source=(https://rubygems.org/downloads/$pkgname-$pkgver.gem)
noextract=(puppetlabs-$pkgname-$pkgver.gem)
sha256sums=('90561b677368115a0b40f37d9c0a65c08be7602c1371c165f7d81c6c286bcc96')

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
