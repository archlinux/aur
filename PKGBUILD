#
# di - diskinfo
#
# Maintainer: uffe _.at._ uffe _.dot._ org
# Past maintainer: Eric Bélanger <eric@archlinux.org>
#

pkgname=di
pkgver=6.0.0
pkgrel=1
pkgdesc="A disk information utility, displaying everything (and more) that your df command does"
arch=('x86_64')
url="https://diskinfo-di.sourceforge.io/"
license=('Zlib')
makedepends=('cmake')
depends=('glibc')
source=(https://sourceforge.net/projects/diskinfo-di/files/${pkgname}-${pkgver}.tar.gz)
sha256sums=('7b663e4db044b1fa4986bd018f827c18e96fe6d1f9a36732dcbb0450e7f518cb')

#
prepare()
{
  cd ${pkgname}-${pkgver}
  cmake -S . -B _build.out --install-prefix "/usr" -DDI_USE_MATH=DI_INTERNAL
}

#
build()
{
  cd "${pkgname}-${pkgver}"
  cmake --build _build.out
}

#
package()
{
  cd "${pkgname}-${pkgver}"
  cmake --install _build.out --prefix "${pkgdir}/usr"
  #install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}

#
# EOF
#
