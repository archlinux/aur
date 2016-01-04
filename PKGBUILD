# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>

_gemname=jekyll
pkgname=ruby-$_gemname
pkgver=3.0.1
pkgrel=1
pkgdesc='A simple, blog aware, static site generator.'
arch=(any)
url='http://github.com/mojombo/jekyll'
license=(MIT)
depends=('ruby>=2.0.0' 'ruby-liquid-2' 'ruby-kramdown>=1.3' 'ruby-mercenary' 'ruby-safe_yaml' 'ruby-colorator>=0.1' 'ruby-pygments.rb' 'ruby-redcarpet' 'ruby-toml'
         'ruby-jekyll-paginate' 'ruby-jekyll-gist' 'ruby-jekyll-coffeescript' 'ruby-jekyll-sass-converter>=1.0' 'ruby-classifier-reborn' 'ruby-jekyll-watch>=1.1')
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha512sums=('6108c822f64c0c7163e75f80040dfcc8be48d1cfb742b35af031fadaac85b6824608803da0470d90926124aaa71da1fb9d39b3365ad1d834208e2ef02d8a025c')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
