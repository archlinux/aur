# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=xr-hardware
pkgver=0.4.0
pkgrel=1
pkgdesc='Udev rules for accessing XR (VR and AR) hardware devices'
arch=('any')
url='https://gitlab.freedesktop.org/monado/utilities/xr-hardware/'
license=('Boost')
makedepends=('python' 'python-attrs')
checkdepends=('flake8')
provides=('oculus-udev' 'osvr-udev' 'psvr-udev' 'vive-udev')
source=("https://gitlab.freedesktop.org/monado/utilities/xr-hardware/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('ee49e96c81b91758fc3b0d8f7bc4c83980ce815a38baff2f914a16670800303c')

build() {
    make -C "${pkgname}-${pkgver}" clean_package all
}

check() {
    make -C "${pkgname}-${pkgver}" test
}

package() {    
    make -C "${pkgname}-${pkgver}" DESTDIR="$pkgdir" PREFIX='/usr' install_package
}
