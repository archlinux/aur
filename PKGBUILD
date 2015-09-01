# Maintainer : anergy <anergy dot 25110321 at gmail dot com>
# Contributor(previous maintainer) : smly <eowner at gmail dot com> 
# Contributor : muflax <muflax at gmail dot com>

pkgname=mplus-font
pkgver=2.2.4
pkgrel=3
pkgdesc="M+ Japanese bitmap fonts"
arch=(any)
license=('custom')
depends=('xorg-xset')
makedepends=('xorg-bdftopcf')
install="$pkgname.install"
url="http://mplus-fonts.sourceforge.jp/"
source=("http://osdn.dl.sourceforge.jp/mplus-fonts/5030/mplus_bitmap_fonts-${pkgver}.tar.gz"
        "10-mplus-font.conf")
md5sums=('a97a99acbee54976407dec828d03850c'
         'f3f797ccbfc193f46fde7c4bd1c6edac')

build() {
    mkdir -p ${srcdir}/mplus_build
    cd $srcdir/mplus_bitmap_fonts-$pkgver
    DESTDIR=${srcdir}/mplus_build ./install_mplus_fonts || return 1
}

package() {
    mkdir -p ${pkgdir}/usr/share/fonts/mplus
    cp mplus_build/* ${pkgdir}/usr/share/fonts/mplus/
    cd $srcdir/mplus_bitmap_fonts-$pkgver
    mkdir -p $pkgdir/usr/share/licenses/custom/${pkgname}
    install -m644 LICENSE_E ${pkgdir}/usr/share/licenses/custom/${pkgname}/license.txt
    install -m644 -D ${srcdir}/10-mplus-font.conf ${pkgdir}/etc/X11/xorg.conf.d/10-mplus-font.conf
}
