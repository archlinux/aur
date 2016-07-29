# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>

_gemname=jekyll
pkgname=ruby-$_gemname
pkgver=3.2.0
pkgrel=1
pkgdesc='A simple, blog aware, static site generator.'
arch=(any)
url='https://github.com/jekyll/jekyll'
license=(MIT)
depends=('ruby' 'ruby-colorator' 'ruby-jekyll-sass-converter' 'ruby-jekyll-watch' 'ruby-kramdown' 'ruby-liquid-3' 'ruby-mercenary' 'ruby-rouge' 'ruby-safe_yaml' 'ruby-rb-fsevent' 'ruby-rb-inotify')
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha512sums=('a845d9d03c745c7d0984d0841ccda248909fc8881f0225402a72e5f466e4e1dd3fa9343fc21bf712d97dd7a68014173a908e859e574a7f4359d12ce30b345e7f')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
