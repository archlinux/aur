# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Contributor ("wookietreiber") <christian dot krause at mailbox dot org>

_gemname=bindata
pkgname=ruby-$_gemname
pkgver=2.4.9
pkgrel=1
pkgdesc="Declarative way to read and write structured binary data"
arch=('any')
url="https://github.com/dmendel/bindata"
license=('custom')
depends=('ruby')
makedepends=('ruby-rdoc' 'ruby-rake')
options=(!emptydirs)
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=($_gemname-$pkgver.gem)
sha256sums=('cfe6227a5e9e6f3d9cbc3d54f0756fd53a6fb666415a290ac93540721403e39b')

package() {
  local _gemdir="$(ruby -rrubygems -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" ${_gemname}-${pkgver}.gem
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/COPYING" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
}
