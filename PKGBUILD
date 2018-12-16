# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=mimemagic
pkgname=ruby-$_gemname
pkgver=0.3.2
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
sha256sums=('78b0601d780a3a0f4bb48c88e03af6dc06610a59bc0f10a877deb50d6b602b02')

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
