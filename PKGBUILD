# Contributor: Madalin Ignisca <madalin.ignisca@gmail.com>
# Maintainer: Pavol (Lopo) Hluchy <lopo AT losys DOT eu>

_gemname=bootstrap-sass
pkgname=ruby-${_gemname}
pkgver=3.4.1
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
sha512sums=('217ffbfee4e33f1104d57091cc1ebde99403b00d61fc96bf1d180806a816f5996cebab33682a3bb42728a965bd9f0a2188ee51a0a7bd44f4ba22f76b196f127b')

package() {
	local _gemdir="$(ruby -e'puts Gem.default_dir')"
	gem install --no-user-install --ignore-dependencies -i "${pkgdir}$_gemdir" ${_gemname}-$pkgver.gem -n "${pkgdir}/usr/bin" || return 1
	rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
	install -Dm644 "${pkgdir}${_gemdir}/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
