# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Vojtěch Aschenbrenner <v@asch.cz>

_gemname="sup"
pkgname="${_gemname}"
pkgver=1.1
pkgrel=1
pkgdesc='Console-based email client for people with a lot of email. Great mutt alternative.'
arch=('any')
url='http://sup-heliotrope.github.io/'
license=('GPL2')
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
  'ruby-xapian-ruby>=1.2'       'ruby-xapian-ruby<2'
)
makedepends=('ruby-rake')
optdepends=(
  'ruby-gpgme>=2.0.2: PGP support'
)
conflicts=('sup-git')
source=("https://rubygems.org/downloads/${_gemname}-${pkgver}.gem")
noextract=("${_gemname}-${pkgver}.gem")
b2sums=('a43e54efbc1a92d04f7ba924ad5cc442542201d4c450c5d2b36e20b9d4efc3c77a38a38dcc3470a739914d15f0f747f4068b81f6e3be0347286c8762ddd6b24d')

package() {
  cd "$srcdir"
  # _gemdir is defined inside package() because if ruby[gems] is not installed on
  # the system, makepkg will exit with an error when sourcing the PKGBUILD.
  local _gemdir="$(ruby -r rubygems -e'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies -i "${pkgdir}/$_gemdir" -n "${pkgdir}/usr/bin" \
    "${_gemname}-${pkgver}.gem"
}
