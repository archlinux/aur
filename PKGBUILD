# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=mimemagic
pkgname=ruby-$_gemname
pkgver=0.3.4
pkgrel=1
pkgdesc='Fast mime detection by extension or content in pure ruby (Uses freedesktop.org.xml shared-mime-info database).'
arch=('any')
url='https://github.com/minad/mimemagic'
license=('MIT')
options=(!emptydirs)
noextract=($_gemname-$pkgver.gem)
depends=('ruby')
makedepends=(rubygems ruby-rdoc)
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
sha256sums=('3751635874b1b0d3ea7daae37be571a5f60cbbbf2977b174d8043a51fe76393b')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install \
    --ignore-dependencies \
    --no-user-install \
    -i "$pkgdir/$_gemdir" \
    -n "$pkgdir/usr/bin" \
    $_gemname-$pkgver.gem

  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"

  install -Dm0644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
