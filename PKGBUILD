# Maintainer: Baptiste Jonglez <baptiste--aur at jonglez dot org>
pkgname=lvmsync
pkgver=3.3.2
pkgrel=1
pkgdesc="Optimised synchronisation of LVM snapshots over a network"
arch=("any")
url="http://theshed.hezmatt.org/lvmsync/"
license=('GPL3')
depends=("ruby" "ruby-treetop" "ruby-git-version-bump")
optdepends=("thin-provisioning-tools: to handle thin snapshots")
options=("!emptydirs")
#source=("https://github.com/mpalmer/${pkgname}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
source=("http://gems.rubyforge.org/gems/${pkgname}-${pkgver}.gem")
sha256sums=('bba2a9e3617eddc7d9f23f9e9887d6b9210f9bddfdb7ecc9254bed15ddcead0a')
noextract=("${pkgname}-${pkgver}.gem")

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies \
      -i "${pkgdir}${_gemdir}" \
      -n "${pkgdir}/usr/bin" \
      "${pkgname}-${pkgver}.gem"
  rm "${pkgdir}/${_gemdir}/cache/${pkgname}-${pkgver}.gem"
}
