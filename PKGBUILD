# Contributor: Madalin Ignisca <madalin.ignisca@gmail.com>
# Maintainer: Pavol (Lopo) Hluchy <lopo AT losys DOT eu>

_gemname=bootstrap-sass
pkgname=ruby-${_gemname}
pkgver=3.4.0
pkgrel=1
pkgdesc='Official Sass port of Bootstrap'
arch=('any')
url='http://getbootstrap.com/css/#sass'
license=("MIT")
depends=('ruby-sass')
makedepends=("rubygems")
optdepends=("ruby-compass")
source=("http://rubygems.org/downloads/${_gemname}-${pkgver}.gem")
noextract=("${_gemname}-${pkgver}.gem")
options=(!strip)
sha512sums=('ba21863215ed1be77228dffccbda47d3accb90ce536218e08ba124ea622c02cc55e909b28101197de3093b803acee290d7562b2aa61b52ecf35221d2811b04b1')

package() {
	local _gemdir="$(ruby -e'puts Gem.default_dir')"
	gem install --no-user-install --ignore-dependencies -i "${pkgdir}$_gemdir" ${_gemname}-$pkgver.gem -n "${pkgdir}/usr/bin" || return 1
	rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
	install -Dm644 "${pkgdir}${_gemdir}/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
