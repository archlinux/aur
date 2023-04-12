# Maintainer: Mario Finelli <mario at finel dot li>
# Contributor: Carsten Feuls <archlinux@carstenfeuls.de>

_gemname=xml-simple
_commit=5adc9d4f5f67603c424bcc1813a5da67573f2564
pkgname=ruby-$_gemname
pkgver=1.1.9
pkgrel=2
pkgdesc="Easy API for working with XML documents"
arch=(any)
url=https://github.com/maik/xml-simple
license=(MIT)
options=(!emptydirs)
depends=(ruby ruby-rexml)
# checkdepends=(ruby-rake ruby-test-unit)
makedepends=(rubygems ruby-rdoc)
source=(${url}/archive/${_commit}.tar.gz)
sha256sums=('760179a4b5c41d0defa34367f89e64044c52d103f6ed9a15f50b970dc27908d9')

build() {
  cd $_gemname-$_commit
  gem build ${_gemname}.gemspec
}

# check() {
#   cd $_gemname-$_commit
#   rake test
# }

package() {
  cd $_gemname-$_commit
  local _gemdir="$(gem env gemdir)"

  gem install \
    --ignore-dependencies \
    --no-user-install \
    -i "$pkgdir/$_gemdir" \
    -n "$pkgdir/usr/bin" \
    $_gemname-$pkgver.gem

  rm -rf "$pkgdir/$_gemdir/cache"

  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm0644 README.adoc "$pkgdir/usr/share/doc/$pkgname/README.adoc"
}

# vim: set ts=2 sw=2 et:
