# Maintainer: Grant Moyer <grantmoyer@gmail.com>
_gemname=rvpacker
pkgname=ruby-$_gemname
pkgver=1.2.0
pkgrel=3
pkgdesc='Pack and unpack RPG Maker data files'
arch=(any)
url='https://github.com/akesterson/rvpacker'
license=(MIT)
depends=(ruby ruby-trollop ruby-formatador)
source=(
	"https://rubygems.org/downloads/$_gemname-$pkgver.gem"
	"https://rubygems.org/downloads/psych-2.0.0.gem"
)
noextract=("$_gemname-$pkgver.gem" "psych-2.0.0.gem")
provides=("ruby-psych=2.0.0")
conflicts=("ruby-psych=2.0.0")
sha256sums=('25764b8d6af445f06b832cd3ab70a89afc95443b5da40f39da736a09c2590aca'
            'd394b18c83790e0a5ed95f5ed847bca178f0ba12a550da495cdcd8720592e708')

package() {
	local _gemdir="$(ruby -e'puts Gem.default_dir')"

	gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" psych-2.0.0.gem
	rm "$pkgdir/$_gemdir/cache/psych-2.0.0.gem"

	gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
	rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}
