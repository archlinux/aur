# Maintainer: Tim Meusel <tim@bastelfreak.de>
# Contributor: Christian Rebischke <Chris.Rebischke@archlinux.org>
# Contributor: Greg Sutcliffe <greg.sutcliffe at gmail dot com>

_gemname=ruby-augeas
pkgname=ruby27-augeas
pkgver=0.5.0
pkgrel=3
pkgdesc='Provides Ruby bindings for augeas'
arch=('x86_64')
url='https://augeas.net'
license=('LGPL')
depends=('ruby2.7' 'augeas')
makedepends=('ruby27-rdoc')
source=("https://rubygems.org/downloads/$_gemname-${pkgver//_/-}.gem")
noextract=("$_gemname-$pkgver.gem")
sha512sums=('523742368543c617baa2b393e4682451d7fe20aecbcf9ab50fed0f5575119b3fbc06f79f0894cca728d2fee7d441cdd9f075dbcf81628835ba870930c3d2ac8d')
options=(!emptydirs)

package() {
  cd "$srcdir"
  # _gemdir is defined inside package() because if ruby[gems] is not installed on
  # the system, makepkg will exit with an error when sourcing the PKGBUILD.
  local _gemdir="$(ruby-2.7 -e'puts Gem.default_dir')"

  gem-2.7 install --no-user-install --ignore-dependencies --install-dir "${pkgdir}${_gemdir}" --bindir "${pkgdir}/usr/bin" "${_gemname}-${pkgver//_/-}.gem"
  rm -rf ${pkgdir}/${_gemdir}/extensions/*/*/${_gemname}-${pkgver}/{mkmf.log,gem_make.out}
  rm -rf "${pkgdir}/${_gemdir}/cache"
  rm -rf "${pkgdir}/${_gemdir}/doc/${_gemname}-${pkgver}/ri/ext"
  rm -rf "${pkgdir}/${_gemdir}/gems/${_gemname}-${pkgver}/ext"
}

# vim:set ts=2 sw=2 et:
