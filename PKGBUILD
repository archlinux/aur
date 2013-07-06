# Maintainer: Sven Schneider <archlinux.sandmann@googlemail.com>

pkgname=orocos-typelib
_pkgname=orocos-toolchain
pkgver=2.6.0
pkgrel=2
pkgdesc="Open Robot Control Software is a tool to create real-time robotics applications using modular, run-time configurable software components (Typelib)"
arch=('i686' 'x86_64')
url="http://www.orocos.org/rtt"
license=('GPL')
groups=('orocos-toolchain')
depends=('orocos-utilmm' 'orocos-utilrb' 'antlr2' 'libxml2')
makedepends=('cmake')
source=(http://people.mech.kuleuven.be/~orocos/pub/stable/toolchain/v${pkgver}/${_pkgname}-${pkgver}-src.tar.bz2)
md5sums=('ac68f90da0d7c4595e5d78687d68ab2f')
sha256sums=('d98adaf4975ffef6b79b7d31f16c488014e347afbc5549910f209db4a9f469fd')
sha384sums=('6fc673dd6a5f034b21f87b2171f6303077a5759cdcc7c9dd745e44b1a51a7a5a4028455c6588b24556d2d3907dd5b372')
sha512sums=('7d30ac8bb751c489302cb15c8a613345aabb2023c935c04f371bb35b52faabd9563e20da384fbe409a7f4533c133eea983484800680d22737be95b37653a6be9')

build() {
  # build typelib
  cd "${srcdir}/${_pkgname}-${pkgver}/typelib"

  # patch for for compilation issues in c and ruby binding
  sed 's#BOOST_STATIC_ASSERT#// BOOST_STATIC_ASSERT#g' -i lang/csupport/containers.cc
  sed 's#elseif (RUBY_19)#else (RUBY_19)#g' -i cmake/RubyExtensions.cmake

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  # install typelib
  cd "${srcdir}/${_pkgname}-${pkgver}/typelib"
  make DESTDIR=${pkgdir} install
}

