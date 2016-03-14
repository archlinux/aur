# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>

_gemname=jekyll
pkgname=ruby-$_gemname
pkgver=3.1.1
pkgrel=2
pkgdesc='A simple, blog aware, static site generator.'
arch=(any)
url='http://github.com/mojombo/jekyll'
license=(MIT)
#depends=('ruby>=2.0.0' 'ruby-liquid-2' 'ruby-kramdown>=1.3' 'ruby-mercenary' 'ruby-safe_yaml' 'ruby-colorator>=0.1' 'ruby-pygments.rb' 'ruby-redcarpet' 'ruby-toml'
#         'ruby-jekyll-paginate' 'ruby-jekyll-gist' 'ruby-jekyll-coffeescript' 'ruby-jekyll-sass-converter>=1.0' 'ruby-classifier-reborn' 'ruby-jekyll-watch>=1.1')
depends=('ruby' 'ruby-colorator' 'ruby-jekyll-sass-converter' 'ruby-jekyll-watch' 'ruby-kramdown' 'ruby-liquid-3' 'ruby-mercenary' 'ruby-rouge' 'ruby-safe_yaml' 'ruby-rb-fsevent' 'ruby-rb-inotify')
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha512sums=('87c818c95164ce3cd75134fe2117929fc8d571513493f1c3e0301d05227f5b76396f53864d809f2f82415d2e2a159f184df297d1200594ec31e24e43991755df')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
