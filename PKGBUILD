# Maintainer: TheCyberArcher <thecyberarcher@protonmail.com>
# Contributor: Matthew Hague <matthewhague@zoho.com>

pkgname=ruby-icalendar
pkgver=2.11.2
pkgrel=5
pkgdesc='Internet calendaring, Ruby style'
arch=('any')
url='https://github.com/icalendar/icalendar'
license=('Ruby')
depends=()
optdepends=('ruby-activesupport: ActiveSupport is required for TimeWithZone support, but not required for general use.')
makedepends=('ruby')
options=('!emptydirs')
source=("http://rubygems.org/downloads/${pkgname#*-}-${pkgver}.gem" "https://raw.githubusercontent.com/icalendar/icalendar/refs/heads/main/LICENSE")
noextract=("${pkgname#*-}-${pkgver}.gem")
sha256sums=('8260c5990d6fb96d7119854a4a24b97f444da6cdb77498039eb1a565bf4b9574' '0e86bd0716d1463c834a241a1b42e7400a7b2b94cddd146edc1069dff4441903')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install --ignore-dependencies --no-user-install -N -i "${pkgdir}"/${_gemdir} ${pkgname#*-}-${pkgver}.gem
  find "${pkgdir}" -type f -name ${pkgname#*-}-$pkgver}.gem -delete
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

