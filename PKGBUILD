#!/hint/bash
# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>

_name=poissonrecon
_fragment="#commit=e04a91d40093dd80669afb07f7d3f586db063ee9"
pkgname=${_name}
pkgver=16.04
pkgrel=1
pkgdesc="Screened Poisson Surface Reconstruction (and Smoothed Signed Distance Reconstruction)"
arch=('i686' 'x86_64')
url="http://www.cs.jhu.edu/~misha/Code/PoissonRecon/Version9.0/"
license=('MIT')
groups=('photogrametry')
depends=('glibc' 'libpng' 'libjpeg' 'boost')
makedepends=('git')
options=(!makeflags)
provides=('poissonrecon' 'ssdrecon' 'surfacetrimmer')
source=("${pkgname}::git+https://github.com/mkazhdan/PoissonRecon.git${_fragment}")
sha256sums=('bf4740bea10f33629e046bae2465357248a1f50b26680f548bcd2e192462e207')

prepare() {
: #git -C ${pkgname} apply -v "${srcdir}"/*.diff
}

build() {
  make -C ${pkgname}
}

package() {
  cd ${pkgname}
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE.txt
  install -Dm755 Bin/Linux/PoissonRecon "${pkgdir}"/usr/bin/poisson-recon
  install -Dm755 Bin/Linux/SSDRecon "${pkgdir}"/usr/bin/ssd-recon
  install -Dm755 Bin/Linux/SurfaceTrimmer "${pkgdir}"/usr/bin/surface-trimmer
}

# vim:set ts=2 sw=2 et:
