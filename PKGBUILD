# Maintainer: Tim Meusel <tim@bastelfreak.de>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Sirat18 <aur@sirat18.de>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>
# Contributor: Alfredo Palhares <masterkorp@masterkorp.net>
# Contributor: mtorromeo

_gemname=diff-lcs
pkgname=ruby27-${_gemname}
pkgver=1.4.4
pkgrel=1
pkgdesc='Diff::LCS computes the difference between two Enumerable sequences using the McIlroy-Hunt longest common subsequence (LCS) algorithm'
url='https://github.com/halostatue/diff-lcs'
arch=('any')
license=('MIT' 'PerlArtistic' 'GPL2')
depends=('ruby2.7')
makedepends=('ruby27-rdoc')
options=('!emptydirs')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/halostatue/diff-lcs/archive/v${pkgver}.tar.gz)
sha512sums=('52fc0501516299396f570be7f35d856ddeed9637430019ca831759467474cecff72be0dace2fed020dacb5f551febef047e3f1928affa0ac0f18b636ee94baa7')

build() {
  cd ${_gemname}-${pkgver}
  gem-2.7 build ${_gemname}.gemspec
}

package() {
  cd ${_gemname}-${pkgver}
  local _gemdir="$(gem-2.7 env gemdir)"
  gem-2.7 install --ignore-dependencies --no-user-install --install-dir "${pkgdir}/${_gemdir}" --bindir "${pkgdir}/usr/bin" ${_gemname}-${pkgver}.gem
  install -Dm 644 README.rdoc -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 License.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
}

# vim: ts=2 sw=2 et:
