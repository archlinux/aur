# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

_gemname=pcaprub
pkgname=ruby-${_gemname}
pkgver=0.12.4
pkgrel=1
pkgdesc='Consistent interface to libpcap packet capture library'
url='https://github.com/pcaprub/pcaprub'
arch=('i686' 'x86_64')
license=('LGPL2.1')
depends=('ruby' 'libpcap')
options=('!emptydirs')
source=(https://rubygems.org/downloads/${_gemname}-${pkgver}.gem)
noextract=(${_gemname}-${pkgver}.gem)
sha512sums=('707221429dcdf95eba24076589054dd022ba8a479148c3ec8ce9667016225ee64bed13d3fdf8ebd46027244feec8e77a484c67f040d0439bfa44d9212997645b')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "${pkgdir}${_gemdir}" -n "${pkgdir}/usr/bin" ${_gemname}-${pkgver}.gem
  install -Dm 644 "${pkgdir}${_gemdir}/gems/${_gemname}-${pkgver}/"{USAGE.rdoc,README.rdoc,FAQ.rdoc} \
    -t "${pkgdir}/usr/share/doc/${pkgname}"
  ln -s "${_gemdir}/gems/${_gemname}-${pkgver}/examples" "${pkgdir}/usr/share/doc/${pkgname}"
  find "${pkgdir}" \( -name gem_make.out -o -name mkmf.log \) -delete
  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
}

# vim: ts=2 sw=2 et:
