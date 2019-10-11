# Maintainer: farwayer <farwayer@gmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>
# Contributor: Alfredo Palhares <masterkorp@masterkorp.net>
# Contributor: Jochen Schalanda <jochen+aur@schalanda.name>

pkgname=ruby-faraday-0.15
pkgver=0.15.4
pkgrel=3
pkgdesc='HTTP/REST API client library.'
arch=('any')
provides=(ruby-faraday=$pkgver)
url='https://github.com/lostisland/faraday'
license=('MIT')
depends=(
  'ruby'
  'ruby-multipart-post>=1.2' 'ruby-multipart-post<3'
)
makedepends=('ruby-rdoc')
options=('!emptydirs')
source=("https://rubygems.org/downloads/faraday-$pkgver.gem")
noextract=("faraday-$pkgver.gem")
sha512sums=('e63bf8a84dfd6a945c7172fe48197f9b022f4d9d8aa63712e249475202eb8e6e070683fe8f0816b1f72d945f3280fed4104b4c6956e2853dc4d13e718be1f23b')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" faraday-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/faraday-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/faraday-$pkgver/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
