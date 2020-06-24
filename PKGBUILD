# Maintainer: DDoSolitary <DDoSolitary@gmail.com>
# Contributor: Carsten Feuls <archlinux@carstenfeuls.de>

_gemname=backports
pkgname=ruby-$_gemname
pkgver=3.18.1
pkgrel=1
pkgdesc='Essential backports that enable many of the nice features of Ruby 1.8.7 up to 2.1.0 for earlier versions.'
arch=(any)
url='http://github.com/marcandre/backports'
license=(MIT)
depends=(ruby)
makedepends=(ruby-rdoc)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha512sums=('ead7b36350da6d6e99ee6e85b9e76a9633f400255162ba6c6bbacd8cd9015d617e3554934fc4e36f84f87e3f8ed84b6a69fb840f30529c860e8a80e762e4a3db')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
