# Maintainer: envolution
# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Vojtěch Aschenbrenner <v@asch.cz>

_gemname="sup"
pkgname="${_gemname}"
pkgver=1.3
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
b2sums=('800736dd3939640ac0931926ac6759e658df21bb0b14886e97715d5a93aa6c89a66de992ff6e408d9d8de5dde810887089ffb8cffd28f4bc6fcc1f0ecb7aab1b')

package() {
  cd "$srcdir"
  # _gemdir is defined inside package() because if ruby[gems] is not installed on
  # the system, makepkg will exit with an error when sourcing the PKGBUILD.
  local _gemdir="$(ruby -r rubygems -e'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies -i "${pkgdir}/$_gemdir" -n "${pkgdir}/usr/bin" \
    "${_gemname}-${pkgver}.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

}
