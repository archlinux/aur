# Maintainer: Pavol (Lopo) Hluchy <lopo AT losys DOT eu>

_gemname=chunky_png
pkgname=ruby-${_gemname}
pkgver=1.3.10
pkgrel=1
pkgdesc='Read/write access to PNG images in pure Ruby'
arch=('any')
url='http://wiki.github.com/wvanbergen/chunky_png'
license=('MIT')
makedepends=('rubygems' 'ruby-rdoc')
source=("http://gems.rubyforge.org/gems/${_gemname}-${pkgver}.gem")
noextract=("${_gemname}-${pkgver}.gem")
options=(!strip)
sha512sums=('968e068a6fbcc3a91d435509a118976de56c62b9e311d201064aae2eb8129994b6c0876ca5ed3368b0415b238f46d14ab1059d00cbf473aaf9631456596e58c3')

package() {
	local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
	gem install --no-user-install --ignore-dependencies -i "${pkgdir}$_gemdir" ${_gemname}-$pkgver.gem -n "${pkgdir}/usr/bin" || return 1
	rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
	install -Dm644 "${pkgdir}${_gemdir}/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
