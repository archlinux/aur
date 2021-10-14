# Maintainer: Tim Meusel <tim@bastelfreak.de>
# Contributor: Christian Rebischke <chris.rebischke@archlinux.org>

_gemname='concurrent-ruby'
_reponame='ruby-concurrent'
pkgname='ruby27-concurrent'
pkgver=1.1.8
pkgrel=1
pkgdesc='Modern concurrency tools including agents, futures, promises, thread pools, actors, supervisors, and more.'
arch=('any')
url="https://github.com/${_reponame}/${_gemname}"
license=('MIT')
depends=('ruby2.7')
makedepends=('ruby27-rdoc')
optdepends=('java-runtime>=8: jruby support')
options=('!emptydirs')
source=("https://rubygems.org/gems/${_gemname}-${pkgver}.gem")
noextract=("${_gemname}-${pkgver}.gem")
sha512sums=('6c33580be8212505c30852bbc9c4e3d988686f3e20d0a7b810d11cb39f8b1bd204ec73a230cea3401230db82c6157dde95d8f4749f5a316e2b01264883cf911b')

package() {
  local _gemdir="$(ruby-2.7 -e 'puts Gem.default_dir')"

  gem-2.7 install --ignore-dependencies --no-user-install --install-dir "${pkgdir}${_gemdir}" --bindir "${pkgdir}/usr/bin" "${_gemname}-${pkgver}.gem"

  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
  install -Dm 644 "${pkgdir}${_gemdir}/gems/${_gemname}-${pkgver}/LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
