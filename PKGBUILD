# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Mario Finelli <mario dot finelli at yahoo dot com>

pkgname=ruby-rspec-puppet
pkgver=4.0.2
pkgrel=3
pkgdesc='RSpec tests for your Puppet manifests'
arch=('any')
url='https://github.com/puppetlabs/rspec-puppet'
license=('MIT')
depends=('ruby-rspec')
source=("https://rubygems.org/downloads/${pkgname#*-}-${pkgver}.gem"
        "https://raw.githubusercontent.com/puppetlabs/rspec-puppet/main/LICENSE")
noextract=("${pkgname#*-}-${pkgver}.gem")
sha256sums=('1a9f6bd65700b69d4061133c05eec92d37b97a80191a06e2e19d6a3a183929c5'
            '58edb1bd86d10b0e4057fe226850304c60a5f876525152bf936a63a8f1356eba')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" ${pkgname#*-}-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/${pkgname#*-}-$pkgver.gem"
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
