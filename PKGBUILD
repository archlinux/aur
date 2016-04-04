# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

_gemname=pcaprub
pkgname=ruby-${_gemname}
pkgver=0.12.1
pkgrel=2
pkgdesc='Consistent interface to libpcap packet capture library'
url='https://github.com/pcaprub/pcaprub'
arch=('i686' 'x86_64')
license=('LGPL2.1')
depends=('ruby' 'libpcap')
options=('!emptydirs')
source=(https://rubygems.org/downloads/${_gemname}-${pkgver}.gem)
noextract=(${_gemname}-${pkgver}.gem)
sha512sums=('afbffd6453339cc5208ed81db120b3a32e449fb73cbeaba5dde4acebcc9be853e73c7331f49ba8a1e0165ccff4fdb7d21ece5ed834eea6871607d19ca46be0df')

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
