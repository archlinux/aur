# Maintainer: Gabriel-Andrew Pollo-Guilbert <gabrielpolloguilbert@gmail.com>

pkgname=libpcanbasic-jni
pkgver=4.2.2
pkgrel=1
pkgdesc='PEAK CAN basic Java native interface '
arch=('x86_64')
url='https://www.peak-system.com/PCAN-USB.199.0.html'
license=('LGPL')
depends=('libpcanbasic')
source=(
    "https://www.peak-system.com/produktcd/Develop/PC%20interfaces/Linux/PCAN-Basic_API_for_Linux/PCAN_Basic_Linux-${pkgver}.tar.gz"
)
sha256sums=(
    "95b1916a28f9dd02d2840da8369558a7e5a3a977b9e9f1046ff67616dcc8977b"
)

prepare() {
    # go into source directory 
    cd "PCAN_Basic_Linux-${pkgver}/pcanjni"

    # add new install target into the makefile
    echo -e ''                                                               >> 'Makefile'
    echo -e 'install-archlinux:'                                             >> 'Makefile'
	echo -e '\tcp $(TARGET) $(DESTDIR)/$(LIBPATH)/$(TARGET)'                 >> 'Makefile'
	echo -e '\tln -sf /$(LIBPATH)/$(TARGET) $(DESTDIR)/$(LIBPATH)/$(SONAME)' >> 'Makefile'
	echo -e '\tln -sf /$(LIBPATH)/$(SONAME) $(DESTDIR)/$(LIBPATH)/$(LDNAME)' >> 'Makefile'
}

build() {
    # go into source directory 
    cd "PCAN_Basic_Linux-${pkgver}/pcanjni"

    # build libpcanbasic
    make clean
    make JAVA_HOME="/usr/lib/jvm/default"
}

package() {
    # go into source directory 
    cd "PCAN_Basic_Linux-${pkgver}/pcanjni"

    # create directories
    install -d "${pkgdir}/usr/lib"

    # install files
    make LIBPATH="usr/lib" DESTDIR="${pkgdir}" install-archlinux
}
