# Maintainer: Pavol (Lopo) Hluchy <lopo AT losys DOT eu>

_gemname=chunky_png
pkgname=ruby-${_gemname}
pkgver=1.3.6
pkgrel=1
pkgdesc='Read/write access to PNG images in pure Ruby'
arch=('any')
url='http://wiki.github.com/wvanbergen/chunky_png'
license=("MIT")
makedepends=("rubygems")
source=("http://gems.rubyforge.org/gems/${_gemname}-${pkgver}.gem")
noextract=("${_gemname}-${pkgver}.gem")
options=(!strip)
sha512sums=('334ea571194a3357003ddbdf41c669ae189c6927c43182a8814e5aa5b3cdee2a3adef80cae4453a3d6d186652c78fdde496bf9080a28227d26dd411dbe0d880e')

package() {
	local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
	gem install --no-user-install --ignore-dependencies -i "${pkgdir}$_gemdir" ${_gemname}-$pkgver.gem -n "${pkgdir}/usr/bin" || return 1
	rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
	install -Dm644 "${pkgdir}${_gemdir}/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
