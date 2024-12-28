# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Michael J. Pento <mjpento@verizon.net>

pkgname=ruby-plist
_gemname=${pkgname#ruby-}
pkgver=3.7.2
pkgrel=1
pkgdesc='A library to manipulate Property List files'
arch=(any)
url="https://rubygems.org/gems/$_gemname"
license=(MIT)
depends=(ruby)
makedepends=(rubygems
             ruby-rdoc)
_archive="$_gemname-$pkgver"
source=("https://rubygems.org/downloads/$_archive.gem")
sha256sums=('d37a4527cc1116064393df4b40e1dbbc94c65fa9ca2eec52edf9a13616718a42')

package() {
	cd "$srcdir"
	local _gemdir="$(ruby -e'puts Gem.default_dir')"
	gem install --ignore-dependencies --no-user-install \
		-i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" "${source[@]##*/}"
        rm "$pkgdir/$_gemdir/cache/${source[@]##*/}"
	local _licensedir="$pkgdir/usr/share/licenses/$pkgname/"
	install -d "$_licensedir"
	ln -s "/$_gemdir/gems/$_archive/LICENSE.txt" "$_licensedir/"
}
