# Maintainer: Mario Finelli <mario at finel dot li>
# Contributor: Artem Vorotnikov <artem at vorotnikov dot me>

_gemname=hiera
pkgname=ruby-$_gemname
pkgver=3.2.0
pkgrel=1
pkgdesc='Light weight hierarchical data store'
arch=(any)
url='https://github.com/puppetlabs/hiera'
license=()
depends=(ruby ruby-json_pure)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('39a5d7a14dafaf4745b1f660e7b78a80d2f2724ac89d467a092305c1eea5f576')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/COPYING" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
