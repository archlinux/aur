# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Vojtěch Aschenbrenner <v@asch.cz>

_gemname="sup"
pkgname="${_gemname}"
pkgver=1.0
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
  'ruby-rmail>=1.1'             'ruby-rmail<2'
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
b2sums=('1c1864b4380e39c425fb41fc2904dd182fd2be446d0685671b943096b24a9d5a60bd1d91b49c26e2b2a7233e959d4f41ef3f2843bfff5a370bae00051b31abb0')

package() {
  cd "$srcdir"
  # _gemdir is defined inside package() because if ruby[gems] is not installed on
  # the system, makepkg will exit with an error when sourcing the PKGBUILD.
  local _gemdir="$(ruby -r rubygems -e'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies -i "${pkgdir}/$_gemdir" -n "${pkgdir}/usr/bin" \
    "${_gemname}-${pkgver}.gem"
}
