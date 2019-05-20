# Maintainer: pingplug < aur at pingplug dot me >
# Submitter: Rolinh < robin DOT hahling AT gw-computing DOT net >
# Contributor: Rolinh < robin DOT hahling AT gw-computing DOT net>

_pkgname=VQMT

pkgname=vqmt-git
pkgver=v1.1.23.ge49803f
pkgrel=1
pkgdesc="Video Quality Measurement Tool which can compute PSNR, SSIM, MS-SSIM, VIFp, PSNR-HVS and PSNR-HVS-M metrics"
arch=('x86_64')
url="https://mmspg.epfl.ch/downloads/vqmt/"
license=('custom')
depends=('opencv')
makedepends=('git'
             'cmake')
source=("git+https://github.com/Rolinh/VQMT.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --tags | sed 's|-|.|g'
}

build() {
  cd "${srcdir}/${_pkgname}"
  cmake \
    -DPREFIX=/usr \
    -DCMAKE_BUILD_TYPE=RELEASE \
    .
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
