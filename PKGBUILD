# Maintainer: Husam Bilal <husam212@gmail.com>
# Contributor: henning mueller <henning@orgizm.net>

pkgname=ruby-libvirt
pkgver=0.7.0
pkgrel=1
pkgdesc='Ruby bindings for libvirt.'
arch=(i686 x86_64)
license=(GPL)
url=http://libvirt.org/ruby/
depends=(ruby libvirt)
makedepends=(rubygems)
source=(
  http://libvirt.org/ruby/download/$pkgname-$pkgver.tgz
)

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
sha256sums=('6d4bb093dc8bab0ec7cb827a95f0a61157238e694c04393597e9380b03229a0a')
