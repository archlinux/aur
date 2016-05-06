pkgver=1.6 
pkgname=alink
pkgdesc="DOS linker which can be used to link 16-bit PE executables targetting DOS or WIN32"
license=('')
arch=('x86_64' 'i386' 'i686' 'armv7h' 'all')
pkgrel=1
source=("http://alink.sourceforge.net/files/alinksrc.zip"
        "alink.patch"
        "util.patch"
        "_Makefile"
        )
sha256sums=('SKIP'
            '6befbba84b2e3709d802a49fd4eb7da475254615c45866744af4fed2727b1af9'
            'c59fd325f3462c2f596da003e27621aae4104b47e046f9482692930e1884a951'
            '2f38c38879c345292f4ff09f771ec4b7385e20edc14a661968916e219b70c8ea')
makedepends=("unzip")

build() {
    cd "${srcdir}"
    unzip alinksrc.zip
    mv ALINK.C alink.c
    mv ALINK.H alink.h
    mv COFF.C coff.c
    mv COFFLIB.C cofflib.c
    mv COMBINE.C combine.c
    mv OBJLOAD.C objload.c
    mv OUTPUT.C output.c
    mv UTIL.C util.c
    
    patch --binary < alink.patch
    patch --binary < util.patch
    
    rm Makefile
    mv _Makefile Makefile
    
    make
}

package() {
    cd "${srcdir}"
    mkdir -p "${pkgdir}/usr/bin"
    
    install --owner=root --group=root --mode=755 "${srcdir}/alink" "${pkgdir}/usr/bin"
}
