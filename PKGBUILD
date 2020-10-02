# Maintainer: Luis Pérez <luis.perez@protonmail.com>
_gemname=http_configuration
pkgname=ruby-$_gemname
pkgver=1.0.4
pkgrel=1
pkgdesc='Gem that provides the ability to set defaults for proxies and timeouts for Net::HTTP.'
arch=(any)
url='https://github.com/bdurand/http_configuration'
license=('MIT')
depends=(
	 'ruby'
	 'ruby-rdoc'
        )
options=(!emptydirs)
source=(
	"https://rubygems.org/downloads/$_gemname-$pkgver.gem"
	"https://raw.githubusercontent.com/bdurand/http_configuration/master/MIT-LICENSE"
       )
sha256sums=(
	    'c3536eb4a22ad9b38321587669cadef2fee01c6eb105f0d45528dcae3273d189'
	    'SKIP'
           )
noextract=(
	   "$_gemname-$pkgver.gem"
	   "MIT-LICENSE"
          )

package() {
  install -Dm644 MIT-LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  local _gemdir="$(ruby -e 'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}
