# Maintainer leedagee <leedageea@gmail.com>
pkgname=arbiter-bin
epoch=2
pkgver=0.1
pkgrel=1

pkgdesc='北京航空航天大学为 NOI Linux 开发的评测工具，用于各大 NOI 系列程序设计竞赛的评测'
arch=('x86_64')
url='http://www.noi.cn/newsview.html?id=267&hash=BDBDBE&type=11'
license=('custom')

depends=('lib32-libxt'
         'lib32-libxinerama'
         'lib32-libxft'
         'lib32-gcc-libs'
         'lib32-libxi'
         'lib32-libxrandr'
         'lib32-libpng12'
         'lib32-libjpeg-turbo'
         'lib32-libxcursor')
optdepends=('gcc: C/C++ support'
            'fpc: Pascal support')

provides=('arbiter')
conflicts=('arbiter')
# 没源码，永远也出不来的包（大雾

source=('runarbiter.sh'
        'arbiter.desktop'
        'https://github.com/leedagee/arbiter-distro/releases/download/v0.1/arbiter.tar.zst')
md5sums=('50738fe70ff208e8012a4d298e3166c4'
         '49ff2ca08c59a2ce0a61d06414571ab9'
         '07707ce5f8272a5b14df95b3cfe7c62a')

package() {
    install -d $pkgdir/usr/bin
    install -d $pkgdir/usr/lib/arbiter/lib
    install -d $pkgdir/usr/lib32
    install -d $pkgdir/usr/share/applications

    install -m644 "$srcdir/arbiter.desktop" "$pkgdir/usr/share/applications"

    install -m755 "$srcdir/arbiter" "$pkgdir/usr/lib/arbiter/arbiter"

    install -m755 "$srcdir/libqt-mt.so.3.3" "$pkgdir/usr/lib/arbiter/lib/libqt-mt.so.3.3"
    ln -s "libqt-mt.so.3.3" "$pkgdir/usr/lib/arbiter/lib/libqt-mt.3"
    
    install -m755 "$srcdir/libqui.so.1.0" "$pkgdir/usr/lib/arbiter/lib/libqui.so.1.0"
    ln -s "libqui.so.1.0" "$pkgdir/usr/lib/arbiter/lib/libqui.1"

    install -m755 "$srcdir/libaudio.so.2" "$pkgdir/usr/lib32/libaudio.so.2"
    ln -s "libaudio.so.2" "$pkgdir/usr/lib32/libaudio.so"

    install -m755 "$srcdir/libjpeg.so.62" "$pkgdir/usr/lib32/libjpeg.so.62"

    install -m755 "$srcdir/libqt.so.3" "$pkgdir/usr/lib32/libqt.so.3"
    ln -s "libqt.so.3" "$pkgdir/usr/lib32/libqt.so"

    cp -r $srcdir/filter $pkgdir/usr/lib/arbiter

    install -m755 "$srcdir/runarbiter.sh" "$pkgdir/usr/bin/arbiter"
}
