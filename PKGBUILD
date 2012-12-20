# Maintainer: Sven Schneider <archlinux.sandmann@googlemail.com>

pkgname=orocos-orogen
_pkgname=orocos-toolchain
pkgver=2.6.0
pkgrel=1
pkgdesc="Open Robot Control Software is a tool to create real-time robotics applications using modular, run-time configurable software components (oroGen)"
arch=('any')
url="http://www.orocos.org/rtt"
license=('GPL')
groups=('orocos-toolchain')
depends=('orocos-typelib' 'orocos-utilrb' 'ruby-facets' 'ruby-nokogiri')
source=(http://people.mech.kuleuven.be/~orocos/pub/stable/toolchain/v${pkgver}/${_pkgname}-${pkgver}-src.tar.bz2)
md5sums=('ac68f90da0d7c4595e5d78687d68ab2f')
sha256sums=('d98adaf4975ffef6b79b7d31f16c488014e347afbc5549910f209db4a9f469fd')
sha384sums=('6fc673dd6a5f034b21f87b2171f6303077a5759cdcc7c9dd745e44b1a51a7a5a4028455c6588b24556d2d3907dd5b372')
sha512sums=('7d30ac8bb751c489302cb15c8a613345aabb2023c935c04f371bb35b52faabd9563e20da384fbe409a7f4533c133eea983484800680d22737be95b37653a6be9')

build() {
  # build orogen
  cd "${srcdir}/${_pkgname}-${pkgver}/orogen"

  RUBYLIB="${srcdir}/${_pkgname}-${pkgver}/orogen/lib" rake
}

package() {
  # install orogen
  cd "${srcdir}/${_pkgname}-${pkgver}/orogen"

  _libdir=`ruby -r rbconfig -e 'printf("%s",RbConfig::CONFIG["rubylibdir"])'`

  install -dm755 "${pkgdir}${_libdir}"
  cp -dr --no-preserve=ownership lib/* "${pkgdir}${_libdir}"

  install -dm755 "${pkgdir}/usr/bin"
  cp -dr --no-preserve=ownership bin/* "${pkgdir}/usr/bin"
}

