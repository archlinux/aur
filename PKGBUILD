_gemname=github-markup
pkgname=ruby-$_gemname
pkgver=4.0.2
pkgrel=1
pkgdesc='The code GitHub uses to render README.markup'
arch=(any)
url='https://github.com/github/markup'
license=(MIT)
depends=(ruby)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha512sums=('5ab1a1ab0c08cbb89e51cc389402082133e1d00f9a3c1d2f96256e73391404278a9e6f7b6257234f73ef43de0e78a9bcab969375385cea61b9ca8a3cacdca9b6')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
