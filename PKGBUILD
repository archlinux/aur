# Maintainer: Gabriel-Andrew Pollo-Guilbert <gabrielpolloguilbert@gmail.com>

pkgname=libpcanbasic-jni
pkgver=4.4.2
pkgrel=1
pkgdesc='PEAK CAN basic Java native interface '
arch=('x86_64')
url='https://www.peak-system.com/PCAN-USB.199.0.html'
license=('LGPL')
depends=('libpcanbasic')
source=(
    "https://www.peak-system.com/produktcd/Develop/PC%20interfaces/Linux/PCAN-Basic_API_for_Linux/PCAN-Basic_Linux-${pkgver}.tar.gz"
)
sha256sums=(
    "b44d76964cbfb60b98b5d3676ef49eaa6d0c70bd10afc8b45a1d28a57968177f"
)

prepare() {
    cd "PCAN-Basic_Linux-${pkgver}/pcanbasic_java/libpcanbasic_jni"

    # add new install target into the makefile
    echo -e ''                                                               >> 'Makefile'
    echo -e 'install-archlinux:'                                             >> 'Makefile'
	echo -e '\tcp $(TARGET) $(DESTDIR)/$(LIBPATH)/$(TARGET)'                 >> 'Makefile'
	echo -e '\tln -sf /$(LIBPATH)/$(TARGET) $(DESTDIR)/$(LIBPATH)/$(SONAME)' >> 'Makefile'
	echo -e '\tln -sf /$(LIBPATH)/$(SONAME) $(DESTDIR)/$(LIBPATH)/$(LDNAME)' >> 'Makefile'
}

build() {
    cd "PCAN-Basic_Linux-${pkgver}/pcanbasic_java/libpcanbasic_jni"

    make clean
    make JAVA_HOME="/usr/lib/jvm/default"
}

package() {
    cd "PCAN-Basic_Linux-${pkgver}/pcanbasic_java/libpcanbasic_jni"

    install -d "${pkgdir}/usr/lib"
    make LIBPATH="usr/lib" DESTDIR="${pkgdir}" install-archlinux
}
