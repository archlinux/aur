# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>

_gemname=fog-xenserver
pkgname=ruby-$_gemname
pkgver=0.2.2
pkgrel=1
pkgdesc='Module for the fog gem to support XENSERVER.'
arch=(any)
url='https://github.com/fog/fog-xenserver'
license=(MIT)
depends=(ruby ruby-fog-core ruby-fog-xml)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha512sums=('e11ae2f335de4e2e0e9f6423b7cf0243c89315ec63917e15914d8539f9c0a3b95511767f62080882ce736a477074b019615c0f7457e46b5fe3806bc7a371f5f1')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
