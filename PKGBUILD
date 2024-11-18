# Maintainer: envolution
# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Vojtěch Aschenbrenner <v@asch.cz>

_gemname="sup"
pkgname="${_gemname}"
pkgver=1.2
pkgrel=3
pkgdesc='Console-based email client for people with a lot of email. Great mutt alternative.'
arch=('any')
url='http://sup-heliotrope.github.io/'
license=('GPL-2.0-or-later')
depends=(
  'ruby'
  'ruby-chronic'
  'ruby-highline'
  'ruby-locale>=2.0'            'ruby-locale<3'
  'ruby-lockfile'
  'ruby-mime-types>2.0'
  'ruby-ncursesw>=1.4.0'        'ruby-ncursesw<1.5'
  'ruby-optimist'
  'ruby-rmail>=1.1.2'           'ruby-rmail<2'
  'ruby-unicode>=0.4.4'         'ruby-unicode<0.5'
  'ruby-unicode-display_width'
  'ruby-xapian-ruby'
)
makedepends=('ruby-rake')
optdepends=(
  'ruby-gpgme>=2.0.2: PGP support'
)
source=("https://rubygems.org/downloads/${_gemname}-${pkgver}.gem")
noextract=("${_gemname}-${pkgver}.gem")
b2sums=('2ec78cfd84973671759479a9197355903e881ef5f1324c9946b785711eeff1fce3a2dbea993dedf90d0b37dad95fa07051d627e587515e9c54193206eabcb14e')

package() {
  cd "$srcdir"
  # _gemdir is defined inside package() because if ruby[gems] is not installed on
  # the system, makepkg will exit with an error when sourcing the PKGBUILD.
  local _gemdir="$(ruby -r rubygems -e'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies -i "${pkgdir}/$_gemdir" -n "${pkgdir}/usr/bin" \
    "${_gemname}-${pkgver}.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

}
