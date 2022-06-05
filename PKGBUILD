# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>

_gemname='gobject-introspection'
pkgname="ruby-${_gemname}-3.4"
pkgver=3.4.9
pkgrel=1
pkgdesc='A Ruby binding of GObjectIntrospection (legacy 3.4.x version)'
arch=('x86_64')
url="https://rubygems.org/gems/${_gemname}/versions/${pkgver}"
license=('LGPL2.1')
depends=(
  'gobject-introspection-runtime'
  'ruby'
  'ruby-glib2>=3.4.9'   'ruby-glib2<3.5'
)
makedepends=(
  'gobject-introspection'
  'ruby-native-package-installer'
)
provides=("${pkgname%-*}=${pkgver}")
options=('!emptydirs')
source=("https://rubygems.org/downloads/${_gemname}-${pkgver}.gem")
noextract=("${_gemname}-${pkgver}.gem")
b2sums=('aac6edc8e9c0314527e02c6daa76ec1a6ca1b056a7d97eba55782d602bd02b5f42b15ba1fbabc1bbb4cb8bb466cc0793c459748b27d7446494462b2683aaa42d')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  local _platform="$(gem env platform | cut -d':' -f2)"
  local _extension_api_version="$(ruby -e'puts Gem.extension_api_version')"
  gem install --ignore-dependencies --no-user-install --no-document -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" "${_gemname}-${pkgver}.gem"
  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem" \
      "${pkgdir}/${_gemdir}/gems/${_gemname}-${pkgver}/ext/gobject-introspection/"*.o \
      "${pkgdir}/${_gemdir}/extensions/${_platform}/${_extension_api_version}/${_gemname}-${pkgver}/gem_make.out" \
      "${pkgdir}/${_gemdir}/gems/${_gemname}-${pkgver}/ext/gobject-introspection/Makefile"
}
