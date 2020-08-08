# Maintainer: Anatoly Bashmakov <anatoly at posteo dot net>

_gemname=sprockets
pkgname=ruby-$_gemname-3
pkgver=3.7.2
pkgrel=1
pkgdesc='Rack-based asset packaging system'
arch=(any)
url='https://github.com/rails/sprockets'
license=(MIT)
depends=(ruby ruby-rack ruby-concurrent)
makedepends=('ruby-rdoc')
provides=("ruby-$_gemname=3.7.2")
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('841a7f1086f1095dc11cbc422ee2487e48bc83db')

package() {
  local _gemdir="$(ruby -e 'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  # non-HEAD version should not install any files in /usr/bin
  rm -r "$pkgdir/usr/bin/"
}
