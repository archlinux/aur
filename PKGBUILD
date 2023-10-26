# Maintainer: Jérôme Poulin <jeromepoulin@gmail.com>

pkgname=ronn
pkgver=0.7.3
pkgrel=1
pkgdesc='Converts markdown to roff manpages'
arch=('any')
url='https://github.com/rtomayko/ronn'
license=('MIT')
depends=('ruby')
options=(!emptydirs)
source=("https://rubygems.org/downloads/$pkgname-$pkgver.gem")
noextract=("$pkgname-$pkgver.gem")
sha1sums=('e30936a7e93204a81dd84fc0bff283b645fa1c29')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  local _platform="$(gem env platform | cut -d':' -f2)"
  local _extension_api_version="$(ruby -e'puts Gem.extension_api_version')"
  gem install --ignore-dependencies --no-user-install --no-document -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $pkgname-$pkgver.gem
  install -D -m644 "$pkgdir/$_gemdir/gems/$pkgname-$pkgver/COPYING" "$pkgdir/usr/share/licenses/$pkgname/COPYING"

  rm "$pkgdir/$_gemdir/cache/$pkgname-$pkgver.gem"
  rm -r "$pkgdir/$_gemdir/gems/$pkgname-$pkgver/test"
}
