# Maintainer: Bert Peters <bert@bertptrs.nl>
# Contributor: Michal Wojdyla < micwoj9292 at gmail dot com >
# Contributor: Charlie Wolf <charlie@wolf.is>

_gemname=foreman
pkgname=ruby-${_gemname}
pkgver=0.87.2
pkgrel=2
pkgdesc="Process manager for Procfile based applications"
arch=('any')
depends=('ruby')
url="https://rubygems.org/gems/${_gemname}"
noextract=($_gemname-$pkgver.gem)
license=('MIT')
source=(
	"https://rubygems.org/downloads/${_gemname}-${pkgver}.gem"
	"$pkgname-$pkgver-LICENSE::https://raw.githubusercontent.com/ddollar/$_gemname/v$pkgver/LICENSE"
)
options=(!emptydirs)
sha256sums=('2727bc6e2100bf80b76e391aefe8c30a9d172b4a8acf56f072f94ffeedeeef6b'
            '2ea6256739b0f021fc38053d3c9ce7103a404033b946c0d7f660b34097044d2e')

package() {
	local _gemdir="$(ruby -e'puts Gem.default_dir')"
	gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
	rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"

    # Manually install the license because the gem contains none
    install -Dm644 "$srcdir/$pkgname-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Move the man page into proper position
    mkdir -p "$pkgdir/usr/share/man/man1"
    mv "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/man/foreman.1" "$pkgdir/usr/share/man/man1"
}
