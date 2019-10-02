# Maintainer: Guillaume Dolle  <dev at gdolle.com>
pkgname=spack
pkgver=0.12.1
pkgrel=1
pkgdesc="A flexible package manager for supercomputer that supports multiple versions, configurations, platforms, and compilers."
arch=('i686' 'x86_64')
url="https://spack.io/"
license=('MIT')
depends=('python')
source=(https://github.com/spack/spack/archive/v${pkgver}.tar.gz)
sha256sums=('511d131b0d0abfe23b9feb84f9464fe654a6e0e4f3064ec026bba58116a074fc')
# See also spack.sh
_spackroot=/opt/spack

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  mkdir -p ${pkgdir}/${_spackroot}
  cp -ax share ${pkgdir}/${_spackroot}
  cp -ax lib ${pkgdir}/${_spackroot}
  cp -ax bin ${pkgdir}/${_spackroot}
  cp -ax etc ${pkgdir}/${_spackroot}
  cp -ax var ${pkgdir}/${_spackroot}
  find ./* -maxdepth 0 -type f \( ! -name ".*" \) -exec install -Dm 644 "{}" "${pkgdir}/${_spackroot}/{}" \;

  mkdir -p ${pkgdir}/etc/profile.d
  ln -sf ${_spackroot}/share/spack/setup-env.sh ${pkgdir}/etc/profile.d/${pkgname}.sh
  ln -sf ${_spackroot}/share/spack/setup-env.csh ${pkgdir}/etc/profile.d/${pkgname}.csh
}

