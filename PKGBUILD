# Maintainer: Mario Finelli <mario at finel dot li>
# Contributor: Tim Meusel <tim at bastelfreak dot de>

_gemname=fast_gettext
pkgname=ruby-$_gemname
pkgver=2.0.1
pkgrel=1
pkgdesc='GetText but 3.5 x faster, 560 x less memory, simple, clean namespace (7 vs 34) and threadsafe!'
arch=(any)
url='https://github.com/grosser/fast_gettext'
license=(MIT RUBY)
depends=(ruby)
# makedepends=(rubygems ruby-rdoc ruby-rake ruby-rspec ruby-bundler)
makedepends=(rubygems ruby-rdoc)
options=(!emptydirs)
source=(https://github.com/grosser/fast_gettext/archive/v${pkgver}/${_gemname}-v${pkgver}.tar.gz)
noextract=($_gemname-$pkgver.gem)
sha256sums=('7f2f93aeb6b88fbd0d9dff82ae2caada1fc5673030d45a8d9aa65c5d4bd47ad5')

build() {
  cd "${_gemname}-${pkgver}"
  gem build "${_gemname}.gemspec"
}

package() {
  cd "${_gemname}-${pkgver}"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install \
    --ignore-dependencies \
    --no-user-install \
    -i "$pkgdir/$_gemdir" \
    -n "$pkgdir/usr/bin" \
    $_gemname-$pkgver.gem

  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"

  # no license file provided in the source
}
