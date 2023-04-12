# Maintainer: Mario Finelli <mario at finel dot li>
# Contributor: Hyacinthe Cartiaux <hyacinthe.cartiaux (a) free.fr>

_gemname=net-ldap
pkgname=ruby-$_gemname
pkgver=0.18.0
pkgrel=1
pkgdesc="Pure Ruby LDAP library"
arch=(any)
url=https://github.com/ruby-ldap/ruby-net-ldap
license=(MIT)
options=(!emptydirs)
depends=(ruby)
makedepends=(rubygems ruby-rdoc)
source=(${url}/archive/v${pkgver}.tar.gz)
sha256sums=('1e379e9d16d96ed510a70deca2f81abe601c626ed1699c2c762a02a227e5a3af')

build() {
  cd $pkgname-$pkgver
  gem build ${_gemname}.gemspec
}

package() {
  cd $pkgname-$pkgver
  local _gemdir="$(gem env gemdir)"

  gem install \
    --ignore-dependencies \
    --no-user-install \
    -i "$pkgdir/$_gemdir" \
    -n "$pkgdir/usr/bin" \
    $_gemname-$pkgver.gem

  rm -rf "$pkgdir/$_gemdir/cache"

  install -Dm0644 License.rdoc "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm0644 README.rdoc "$pkgdir/usr/share/doc/$pkgname/README.rdoc"
}

# vim: set ts=2 sw=2 et:
