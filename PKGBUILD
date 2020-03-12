# Maintainer leedagee
pkgname=arbiter-bin
epoch=1
pkgver=1.4
pkgrel=515
# 臭包，但是 pkgrel++ 了

pkgdesc='北京航空航天大学为 NOI Linux 开发的评测工具，用于各大 NOI 系列程序设计竞赛的评测'
arch=('x86_64')
url='http://www.noi.cn/newsview.html?id=267&hash=BDBDBE&type=11'
license=('custom')
# 没分发许可，xjb搞就行了

depends=('lib32-libxt' 'lib32-libxinerama' 'lib32-libxft' 'lib32-gcc-libs' 'lib32-libxi' 'lib32-libxrandr' 'lib32-libxcursor')
# ldd 来的，谁知道对不对呢（

provides=('arbiter')
conflicts=('arbiter')
# 没源码，永远也出不来的包（大雾

source=('runarbiter.sh'
        'https://github.com/leedagee/arbiter-distro/releases/download/v0.1/arbiter.tar.zst')
# 哦，在这递归
# arbiter.tar.zst 会包含
# arbiter libaudio.so.2 libjpeg.so.62 libpng12.so.0
# libqt-mt.so.3.3 libqt.so.3 libqui.so.1.0 fileter/

package() {
    install -d $pkgdir/usr/bin
    install -d $pkgdir/usr/lib/arbiter/lib
    install -d $pkgdir/usr/lib32


    install -m755 "$srcdir/arbiter" "$pkgdir/usr/lib/arbiter/arbiter"

    install -m755 "$srcdir/libqt-mt.so.3.3" "$pkgdir/usr/lib/arbiter/lib/libqt-mt.so.3.3"
    ln -s "libqt-mt.so.3.3" "$pkgdir/usr/lib/arbiter/lib/libqt-mt.3"
    
    install -m755 "$srcdir/libqui.so.1.0" "$pkgdir/usr/lib/arbiter/lib/libqui.so.1.0"
    ln -s "libqui.so.1.0" "$pkgdir/usr/lib/arbiter/lib/libqui.1"

    install -m755 "$srcdir/libaudio.so.2" "$pkgdir/usr/lib32/libaudio.so.2"
    ln -s "libaudio.so.2" "$pkgdir/usr/lib32/libaudio.so"

    install -m755 "$srcdir/libjpeg.so.62" "$pkgdir/usr/lib32/libjpeg.so.62"
    # 为难 # libjpeg.so.8.2.2 was owned by lib32-libjpeg-turbo

    install -m755 "$srcdir/libpng12.so.0" "$pkgdir/usr/lib32/libpng12.so.0"
    ln -s "libpng12.so.0" "$pkgdir/usr/lib32/libpng12"

    install -m755 "$srcdir/libqt.so.3" "$pkgdir/usr/lib32/libqt.so.3"
    ln -s "libqt.so.3" "$pkgdir/usr/lib32/libqt.so"
    # 这年头没多少敢直接叫 libqt 的库了, conflict 自己认栽

    cp -r $srcdir/filter $pkgdir/usr/lib/arbiter

    install -m755 "$srcdir/runarbiter.sh" "$pkgdir/usr/bin/arbiter"
}
md5sums=('6b0d4c98fa90eb78cd7a3ab8daa76d2d'
         '07707ce5f8272a5b14df95b3cfe7c62a')
