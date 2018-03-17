# Maintainer: Tim Meusel <tim@bastelfreak.de>

_gemname='net-ping'
pkgname="ruby-${_gemname}"
pkgver=2.0.3
pkgrel=1
pkgdesc='The net-ping library provides a ping interface for Ruby. It includes separate TCP, HTTP, LDAP, ICMP, UDP, WMI (for Windows) and external ping classes.'
arch=('any')
url='https://github.com/chernesk/net-ping'
license=('Artistic 2.0')
depends=(ruby)
makedepends=(ruby-rdoc)
options=(!emptydirs)
source=("https://rubygems.org/downloads/${_gemname}-${pkgver}.gem" 'LICENSE')
noextract=("${_gemname}-${pkgver}.gem")
sha512sums=('e134f26abdb9cde5d8a81b1ffa5e12f506a5fd821b4ece2b54a407c7aec6815a1660a939565cc407fe16efa11c26cef8af889a436e5a436aea74b09de477e568'
            'fc80e00e3ccf37887958cc0a63b49a0affbe9b36690ffad1a34edf8ffa0155c7119c495c58d58743cc5b9af0a40a969f96875fdb5aa817c96c1cdbf7d4339857')
package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install --verbose \
    --ignore-dependencies \
    --no-user-install \
    --install-dir "${pkgdir}/${_gemdir}" \
    -n "$pkgdir/usr/bin" \
    $_gemname-$pkgver.gem

  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
  install -D -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
