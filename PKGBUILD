# Contributor: Madalin Ignisca <madalin.ignisca@gmail.com>
# Maintainer: Pavol (Lopo) Hluchy <lopo AT losys DOT eu>

_gemname=bootstrap-sass
pkgname=ruby-${_gemname}
pkgver=3.3.6
pkgrel=1
pkgdesc='Official Sass port of Bootstrap'
arch=('any')
url='http://getbootstrap.com/css/#sass'
license=("MIT")
depends=('ruby-sass')
makedepends=("rubygems")
optdepends=("ruby-compass")
source=("http://gems.rubyforge.org/gems/${_gemname}-${pkgver}.gem")
noextract=("${_gemname}-${pkgver}.gem")
options=(!strip)
sha512sums=('e2b29acb5ffbfe7f3427fe2e0cd5675941f7d69491d1525f2d8583122efc7b31fd9a35d09834b42695c6f3c85da98abcc9170640be057f11b4602ff0b9090837')

package() {
	local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
	gem install --no-user-install --ignore-dependencies -i "${pkgdir}$_gemdir" ${_gemname}-$pkgver.gem -n "${pkgdir}/usr/bin" || return 1
	rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
	install -Dm644 "${pkgdir}${_gemdir}/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
