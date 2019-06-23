# Maintainer: Bert Peters <bert@bertptrs.nl>

_gemname=gollum
pkgname=ruby-$_gemname
pkgver=4.1.2
pkgrel=2
pkgdesc='A simple, Git-powered wiki.'
arch=(any)
url='http://github.com/gollum/gollum'
license=(MIT)
depends=(ruby ruby-rouge-2.1 ruby-gollum-lib ruby-kramdown ruby-mustache ruby-useragent)
options=(!emptydirs)
source=(
    https://rubygems.org/downloads/$_gemname-$pkgver.gem
    https://rubygems.org/downloads/sinatra-1.4.4.gem
    https://rubygems.org/downloads/sanitize-2.1.1.gem
    https://rubygems.org/downloads/twitter-text-1.14.7.gem
    https://rubygems.org/downloads/unf-0.1.0.gem
    https://rubygems.org/downloads/unf_ext-0.0.7.6.gem
    https://rubygems.org/downloads/tilt-1.3.4.gem
    https://rubygems.org/downloads/rack-protection-1.4.0.gem
)
sha256sums=(
    'aa4c33e72fb2eefd3851ccd0ca792c89919e0022581de431c35135509ca83714'
    '1a16a552d559be0fff6cefd2c84c1fecafcc54668fba540e99fe8f2692033e8a'
    '28a17c1adbb14f167410d8f0f1e67cbd8b309718ec581c8461af810c500b378a'
    '6fbf511d449d61a2e2198dd758622193aa74d6e95a6ec7111725cce0e181629c'
    '847e49e3b2d5a7983d8264e98b146863004b13d21c65aaef67946955dcec1e90'
    'ae5bf2c42c6ed31942972faaf39c7bfdd97aa44530852e37c701c11589e186d2'
    'ca00c2aa40524e08ad8a8bb4505981e254441a9095882d43bf6f0f67a14e8543'
    '6092b436f93490d580a6ee6840888cf40804ee65c65f4bc6cf497e47c06bde35'
)
noextract=(
    $_gemname-$pkgver.gem
    sinatra-1.4.4.gem
    sanitize-2.1.1.gem
    twitter-text-1.14.7.gem
    unf-0.1.0.gem
    unf_ext-0.0.7.6.gem
    tilt-1.3.4.gem
    rack-protection-1.4.0.gem
)

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install \
    --ignore-dependencies \
    --no-user-install \
    --install-dir "$pkgdir/$_gemdir" \
    --bindir "$pkgdir/usr/bin" \
    sinatra-1.4.4.gem \
    sanitize-2.1.1.gem \
    twitter-text-1.14.7.gem \
    unf-0.1.0.gem \
    unf_ext-0.0.7.6.gem \
    tilt-1.3.4.gem \
    rack-protection-1.4.0.gem \
    $_gemname-$pkgver.gem

  rm -rf "$pkgdir/$_gemdir/cache"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

