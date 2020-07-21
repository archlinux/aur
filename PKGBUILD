# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Contributor ("wookietreiber") <christian.krause@mailbox.org>

_gemname=bindata
pkgname=ruby-$_gemname
pkgver=2.4.8
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
sha256sums=('2c16c5148d1b6cac59a4fb33ccfbfff8aed8bd6903a4262a373e075896c4b4ae')

package() {
  local _gemdir="$(ruby -rrubygems -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" ${_gemname}-${pkgver}.gem
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/COPYING" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
}
