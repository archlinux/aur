# Maintainer: Roland Singer <roland.singer@desertbit.com>
# Upstream URL: https://github.com/pez2001/razer_chroma_drivers

pkgbase=razer_chroma_drivers
pkgname=('razer_chroma_drivers' 'razer_chroma_drivers-dkms')
pkgver=20160714
pkgrel=1
arch=('x86_64' 'i686')
url='http://pez2001.github.io/razer_chroma_drivers/'
license=('GPLv2')
makedepends=('git' 'linux-headers')
source=("git+https://github.com/m4ng0squ4sh/razer_chroma_drivers.git")
md5sums=('SKIP')

build() {
    cd "$srcdir/razer_chroma_drivers"
    make -s -j1 all
}

package_razer_chroma_drivers() {
    pkgdesc='A collection of Linux drivers for Razer Chroma devices.'
    depends=('libdbus' 'jq' 'python' 'razer_chroma_drivers-dkms')
    install="razer_chroma_drivers.install"

    cd "$srcdir/razer_chroma_drivers"
    make -s -j1 DESTDIR="$pkgdir" PYTHONDIR="/usr/lib/python3.5/site-packages" arch_install
}

package_razer_chroma_drivers-dkms() {
    pkgdesc='DKMS support for the razer_chroma_drivers package.'
    depends=('dkms')

    cd "$srcdir/razer_chroma_drivers"
    make -s -j1 DESTDIR="$pkgdir" setup_dkms
}
