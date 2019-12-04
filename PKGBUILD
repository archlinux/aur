# Maintainer: Husam Bilal <me@husam.dev>
# Contributor: henning mueller <henning@orgizm.net>

pkgname=ruby-libvirt
pkgver=0.7.1
pkgrel=1
pkgdesc='Ruby bindings for libvirt.'
arch=(i686 x86_64)
license=(GPL)
url=http://libvirt.org/ruby/
depends=(ruby libvirt)
makedepends=(rubygems ruby-rake)
source=(http://libvirt.org/ruby/download/$pkgname-$pkgver.tgz)
sha256sums=('4e1495d64af5ce9edba80f973a2e2eb125946c0fa266c8f9d75f1e7a98fc5d60')

package() {
  cd $srcdir/$pkgname-$pkgver

  export RBENV_VERSION=system
  rvm use system 2>/dev/null || true

  rake gem

  local _gemdir="$(ruby -rubygems -e 'puts Gem.default_dir')"

  gem install \
    --ignore-dependencies \
    --no-user-install \
    -i "$pkgdir$_gemdir" \
    pkg/$pkgname-$pkgver.gem
}
