# Maintainer: Kherim Willems <kherimwillems @ gmail dot com>

_pkgname=namd-multicore-cuda
pkgname=$_pkgname-bin
pkgver=2.13
pkgrel=1
pkgdesc="Parallel molecular dynamics code designed for high-performance simulation of large biomolecular systems."
arch=("x86_64")
url="http://www.ks.uiuc.edu/Research/namd/"
license=("custom")
depends=("bash")
optdepends=("python: Running additional library scripts.")
provides=("$_pkgname" "namd")
conflicts=("$_pkgname" "$_pkgname-bin" "namd")
# You MUST download the package from the NAMD url and put it in the PKGBUILD folder!
# Current download should be:
# Linux-x86_64-multicore-CUDA (NVIDIA CUDA acceleration)
source=("local://NAMD_${pkgver}_Linux-$arch-multicore-CUDA.tar.gz")
md5sums=('80f7b3a661f5fd80ccac78b7bc32035c')

package() {
  cd $srcdir/NAMD_${pkgver}_Linux-$arch-multicore-CUDA

  # License file
  install -Dm644 $srcdir/NAMD_${pkgver}_Linux-$arch-multicore-CUDA/license.txt ${pkgdir}/usr/share/licenses/$pkgname/LICENSE

  # Executable files
  install -Dm 755 $srcdir/NAMD_${pkgver}_Linux-$arch-multicore-CUDA/charmrun "${pkgdir}"/usr/bin/charmrun
  install -Dm 755 $srcdir/NAMD_${pkgver}_Linux-$arch-multicore-CUDA/flipbinpdb "${pkgdir}"/usr/bin/flipbinpdb
  install -Dm 755 $srcdir/NAMD_${pkgver}_Linux-$arch-multicore-CUDA/flipdcd "${pkgdir}"/usr/bin/flipdcd
  install -Dm 755 $srcdir/NAMD_${pkgver}_Linux-$arch-multicore-CUDA/namd2 "${pkgdir}"/usr/bin/namd2
  install -Dm 755 $srcdir/NAMD_${pkgver}_Linux-$arch-multicore-CUDA/psfgen "${pkgdir}"/usr/bin/psfgen
  install -Dm 755 $srcdir/NAMD_${pkgver}_Linux-$arch-multicore-CUDA/sortreplicas "${pkgdir}"/usr/bin/sortreplicas

  # CUDA and CUFFT libraries
  install -Dm 644 $srcdir/NAMD_${pkgver}_Linux-$arch-multicore-CUDA/libcudart.so.9.1 \
                  "${pkgdir}"/usr/lib/libcudart.so.9.1
  install -Dm 644 $srcdir/NAMD_${pkgver}_Linux-$arch-multicore-CUDA/libcufft.so.9.1 \
                  "${pkgdir}"/usr/lib/libcufft.so.9.1

  # Other modules and scripts
  cp -Rf --preserve=mode $srcdir/NAMD_${pkgver}_Linux-$arch-multicore-CUDA/lib "${pkgdir}"/usr/share/${_pkgname}
}
