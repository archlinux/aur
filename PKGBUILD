# Maintainer: Mario Finelli <mario at finel dot li>
# Contributor: Jörg Thalheim <joerg@higgsboson.tk>

_gemname=netaddr
pkgname=ruby-$_gemname
pkgver=2.0.6
pkgrel=1
pkgdesc="A Ruby library for performing calculations on IPv4 and IPv6 subnets"
arch=(any)
url=https://github.com/dspinhirne/netaddr-rb
license=(Apache)
options=(!emptydirs)
depends=(ruby)
checkdepends=(ruby-test-unit)
makedepends=(rubygems ruby-rdoc)
source=(${url}/archive/${pkgver}.tar.gz)
sha256sums=('d65cd362d10fd6bc020b1859cc16062464cb681758f90fd2f3fe0fdadcc85430')

build() {
  cd $_gemname-rb-$pkgver
  gem build ${_gemname}.gemspec
}

check() {
  cd $_gemname-rb-$pkgver
  ruby test/run_all.rb
}

package() {
  cd $_gemname-rb-$pkgver
  local _gemdir="$(gem env gemdir)"

  gem install \
    --ignore-dependencies \
    --no-user-install \
    -i "$pkgdir/$_gemdir" \
    -n "$pkgdir/usr/bin" \
    $_gemname-$pkgver.gem

  rm -rf "$pkgdir/$_gemdir/cache"

  install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# vim: set ts=2 sw=2 et:
