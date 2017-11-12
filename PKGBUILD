pkgname=(dvdread-git)
pkgver=0.6be9c87
pkgrel=1
pkgdesc="Utility for creating deCSSed images of protected DVDs"
arch=('i686' 'x86_64')
url=https://github.com/xrgtn/dvdread
license=(Unknown)
source=('git+https://github.com/xrgtn/dvdread.git'
        'seek_mpeg.patch')
md5sums=('SKIP'
         'adb25381b347136d0832de701748578a')

pkgver() {
        cd "dvdread"
        echo 0.$( git describe --always | sed 's#-#_#g;s#v##' )
}

#prepare(){
#        cd "${srcdir}/dvdread"
#        #See https://www.videolan.org/developers/libdvdcss/doc/html/dvdcss_8h.html#adb7100ec59427598e1c42fdc0429b63a
#        patch -Np2 < "${srcdir}/seek_mpeg.patch"
#}

build(){
        cd "${srcdir}/dvdread"
        make dvdread
}

package(){
        cd "${srcdir}/dvdread"
        mkdir -m755 -p "${pkgdir}/usr/bin/"
        install -m755 dvdread "${pkgdir}/usr/bin/"
}

