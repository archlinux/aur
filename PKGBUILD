# Maintainer: Mario Finelli <mario at finel dot li>
# Contributor: Artem Vorotnikov <artem at vorotnikov dot me>

_gemname=pry
pkgname=ruby-$_gemname
pkgver=0.13.0
pkgrel=2
pkgdesc='An IRB alternative and runtime developer console.'
arch=(any)
url='http://pryrepl.org'
license=(MIT)
depends=(ruby ruby-coderay ruby-method_source)
makedepends=(rubygems ruby-rdoc)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('74b7d9b871845970a5a336e117bf2a7b292d66f39af2bbc16821cac72db4fb51')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install \
    --ignore-dependencies \
    --no-user-install \
    -i "$pkgdir/$_gemdir" \
    -n "$pkgdir/usr/bin" \
    $_gemname-$pkgver.gem

  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"

  install -Dm0644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
