# Maintainer: TheCyberArcher <thecyberarcher@protonmail.com>
# Contributor: Matthew Hague <matthewhague@zoho.com>

pkgname=ruby-icalendar
pkgver=2.11.0
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
sha256sums=('899ddd506bb48beea250a1afd674ff0644a3dd2f8c49e02b1a91795b03b7541c' '0e86bd0716d1463c834a241a1b42e7400a7b2b94cddd146edc1069dff4441903')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install --ignore-dependencies --no-user-install -N -i "${pkgdir}"/${_gemdir} ${pkgname#*-}-${pkgver}.gem
  find "${pkgdir}" -type f -name ${pkgname#*-}-$pkgver}.gem -delete
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

