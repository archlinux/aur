# Maintainer: Tim Meusel <tim@bastelfreak.de>
# Contributor: Felix Yan <felixonmars@archlinux.org>

_gemname=multi_json
pkgname="ruby27-${_gemname}"
pkgver=1.15.0
pkgrel=1
pkgdesc='A common interface to multiple JSON libraries.'
arch=('any')
url="https://github.com/intridea/${_gemname}"
license=('MIT')
depends=('ruby2.7')
makedepends=('ruby27-rdoc')
options=('!emptydirs')
source=("https://rubygems.org/downloads/${_gemname}-$pkgver.gem")
noextract=("${_gemname}-${pkgver}.gem")
sha512sums=('5021b66bd607bde8679899ff48fbf596cdf6a4f6c026472b20f25bd1933d105bef597c143ab529804d7b5a4a244476be24555f13a7fbe9fef30bbe1fb92978eb')

package() {
  local _gemdir="$(ruby-2.7 -e'puts Gem.default_dir')"
  gem-2.7 install --ignore-dependencies --no-user-install --install-dir "${pkgdir}/${_gemdir}" --bindir "${pkgdir}/usr/bin" "${_gemname}-${pkgver}.gem"
  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
  install -D -m644 "${pkgdir}/${_gemdir}/gems/${_gemname}-${pkgver}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
