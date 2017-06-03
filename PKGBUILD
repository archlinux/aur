# Maintainer: kausban <mail at kausban com>
pkgname=libmpsse_spi
pkgver=0.41
pkgrel=1
pkgdesc="The LibMPSSE-SPI library has been created to to aid the implementation of SPI designs using FTDI devices which incorporate the FTDI MPSSE (FT4232H, FT2232H, FT2232D and FT232H) by taking care of all the required MPSSE commands."
arch=('i686' 'x86_64')
url="http://www.ftdichip.com/"
license=('GPL')
groups=()
depends=('libftd2xx')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://www.ftdichip.com/Support/SoftwareExamples/MPSSE/LibMPSSE-SPI/LibMPSSE-SPI_source.zip")
noextract=()
md5sums=('d551e99a9dc403c95941ffac13ab81a7')
# Keep static lib
options=(!strip staticlibs)

prepare() {
    cd "$srcdir/LibMPSSE-SPI_source/LibMPSSE-SPI/LibMPSSE/Build/Linux/"
    make clean -i
}    

build() {
    cd "$srcdir/LibMPSSE-SPI_source/LibMPSSE-SPI/LibMPSSE/Build/Linux/"
    make
}


package() {
    # Make required dirs
    mkdir -p ${pkgdir}/usr/{lib,include}

    # Install versioned so file as well as static library
    install -Dm755 ${srcdir}/LibMPSSE-SPI_source/LibMPSSE-SPI/LibMPSSE/Build/Linux/libMPSSE.so ${pkgdir}/usr/lib/libMPSSE.so.${pkgver}
    install -m644 ${srcdir}/LibMPSSE-SPI_source/LibMPSSE-SPI/LibMPSSE/Build/Linux/libMPSSE.a ${pkgdir}/usr/lib/libMPSSE.a

    # Link versioned so file to generic
    ln -sf /usr/lib/libMPSSE.so.${pkgver} "${pkgdir}"/usr/lib/libMPSSE.so
    
    # Install Headers
    install -m644 ${srcdir}/LibMPSSE-SPI_source/LibMPSSE-SPI/Release/include/libMPSSE_spi.h ${pkgdir}/usr/include/
}
