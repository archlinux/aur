# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=mechanize
pkgname=ruby-$_gemname
pkgver=2.9.1
pkgrel=1
pkgdesc="The Mechanize library is used for automating interaction with websites"
arch=(any)
url=https://github.com/sparklemotion/mechanize
license=(MIT)
depends=(
  ruby
  ruby-addressable
  ruby-domain_name
  ruby-http-cookie
  ruby-mime-types
  ruby-net-http-digest_auth
  ruby-net-http-persistent
  ruby-nokogiri
  ruby-rubyntlm
  ruby-webrick
  ruby-webrobots
)
checkdepends=(ruby-rake ruby-minitest)
makedepends=(git rubygems ruby-rdoc)
options=(!emptydirs)
source=(git+https://github.com/sparklemotion/mechanize.git?tag=v${pkgver})
sha256sums=('SKIP')

build() {
  cd $_gemname
  gem build ${_gemname}.gemspec
}

check() {
  cd $_gemname
  rake test
}

package() {
  cd $_gemname
  local _gemdir="$(gem env gemdir)"

  gem install \
    --ignore-dependencies \
    --no-user-install \
    -i "$pkgdir/$_gemdir" \
    -n "$pkgdir/usr/bin" \
    $_gemname-$pkgver.gem

  rm -rf "$pkgdir/$_gemdir/cache"

  install -Dm0644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm0644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}

# vim: set ts=2 sw=2 et:
