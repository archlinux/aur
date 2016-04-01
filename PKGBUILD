# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>

_gemname=jekyll
pkgname=ruby-$_gemname
pkgver=3.1.2
pkgrel=1
pkgdesc='A simple, blog aware, static site generator.'
arch=(any)
url='https://github.com/jekyll/jekyll'
license=(MIT)
depends=('ruby' 'ruby-colorator' 'ruby-jekyll-sass-converter' 'ruby-jekyll-watch' 'ruby-kramdown' 'ruby-liquid-3' 'ruby-mercenary' 'ruby-rouge' 'ruby-safe_yaml' 'ruby-rb-fsevent' 'ruby-rb-inotify')
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha512sums=('5452e93413d60d93958e6c7085203171130dda127c39405640fc072b45eae10e37d6fe0b7a0731002405050af7c41cb12180eaf5d4743503de230ab97b9b812e')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
