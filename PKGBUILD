# Maintainer: KafCoppelia <k740677208@gmail.com>

pkgname=xilinx_xdma-git
_pkgbase=xdma
pkgver=r129.55cf498
pkgrel=1
pkgdesc="Xilinx XDMA IP driver version 2020.2.0, modified in kernel 5.19"
arch=('i686' 'x86_64')
license=('GPL')
url="https://github.com/KafCoppelia/xdma_ip_driver"
depends=('dkms' 'bc' 'linux-headers')
makedepends=('git')
conflicts=("${_pkgbase}")
source=("git+https://github.com/KafCoppelia/xdma_ip_driver")
sha256sums=('SKIP')
            
pkgver() {
    cd ${srcdir}/xdma_ip_driver
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd /usr/src/linux/certs
    sudo openssl req -new -x509 -newkey rsa:2048 -keyout signing_key.pem -outform DER -out signing_key.x509 -nodes -subj "/CN=Owner/"
    cd ${srcdir}/xdma_ip_driver/${_pkgbase}
    sudo make install -j8
}
