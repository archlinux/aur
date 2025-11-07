# Maintainer: kmille <github@androidloves.me>
# Maintainer: Mario Finelli <mario at finel dot li>

pkgname=puppet-lint
pkgver=5.1.1
pkgrel=1
pkgdesc="Check that your Puppet manifests conform to the style guide."
arch=(any)
url="https://github.com/puppetlabs/puppet-lint"
license=('MIT')
depends=('ruby')
makedepends=('rubygems' 'ruby-rdoc')
source=(https://rubygems.org/downloads/$pkgname-$pkgver.gem)
noextract=(puppetlabs-$pkgname-$pkgver.gem)
sha256sums=('1e774edbe95c67aae93974416e0d452d6b5fc2c737196a67dd7e5ab548344486')

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
