# Maintainer: pingplug <pingplug@foxmail.com>
# Submitter: Rolinh <robinDOThahlingATgw-computingDOTnet>
# Contributor: Rolinh <robinDOThahlingATgw-computingDOTnet>

pkgname=vqmt-git
_pkgname=VQMT
pkgver=v1.1.22.g4e32135
pkgrel=1
pkgdesc="Video Quality Measurement Tool which can compute PSNR, SSIM, MS-SSIM, VIFp, PSNR-HVS and PSNR-HVS-M metrics"
arch=('x86_64' 'i686')
url="https://mmspg.epfl.ch/vqmt"
license=('custom')
depends=('opencv')
makedepends=('git' 'cmake')
source=("git+https://github.com/Rolinh/VQMT.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"

  git describe --tags | sed 's|-|.|g'
}

build() {
  cd "$srcdir/$_pkgname"

  cmake ./ -DPREFIX=/usr -DCMAKE_BUILD_TYPE=RELEASE
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="${pkgdir}" install

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
