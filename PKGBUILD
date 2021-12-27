# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=xr-hardware
pkgver=1.0.0
pkgrel=1
pkgdesc='Udev rules for accessing XR (VR and AR) hardware devices'
arch=('any')
url='https://gitlab.freedesktop.org/monado/utilities/xr-hardware/'
license=('Boost')
makedepends=('python' 'python-attrs')
checkdepends=('flake8')
provides=('oculus-udev' 'osvr-udev' 'psvr-udev' 'vive-udev')
source=("https://gitlab.freedesktop.org/monado/utilities/xr-hardware/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('6e0b708f225471f80d6159d7ddd58d1a200bd9bbc07eee576ec2d627365b3f77')

build() {
    make -C "${pkgname}-${pkgver}" clean_package all
}

check() {
    make -C "${pkgname}-${pkgver}" test
}

package() {    
    make -C "${pkgname}-${pkgver}" DESTDIR="$pkgdir" PREFIX='/usr' install_package
}
