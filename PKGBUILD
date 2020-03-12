# Maintainer leedagee
pkgname=arbiter-bin
epoch=1
pkgver=1.4
pkgrel=514
# 臭包

pkgdesc='北京航空航天大学为 NOI Linux 开发的评测工具，用于各大 NOI 系列程序设计竞赛的评测'
arch=('x86_64')
url='http://www.noi.cn/newsview.html?id=267&hash=BDBDBE&type=11'
license=('custom')
# 没分发许可，xjb搞就行了

depends=('lib32-libxt' 'lib32-libxinerama' 'lib32-libxft' 'lib32-gcc-libs')
# ldd 来的，谁知道对不对呢（

provides=('arbiter')
conflicts=('arbiter')
# 没源码，永远也出不来的包（大雾

source=('runarbiter.sh'
        'https://slanterns.net/arbiter.tar.zst')
# 感谢群友 host ~放在根域名根目录）~
# arbiter.tar.zst 会包含
# arbiter libaudio.so.2 libjpeg.so.62 libpng12.so.0
# libqt-mt.so.3.3 libqt.so.3 libqui.so.1.0
md5sums=('d7f84db1b206948d0ed8a4df4ffc4179'
         'b99da96d36ce9b0d934959bddf56654a')

package() {
    install -d $pkgdir/usr/bin
    install -d $pkgdir/usr/share/arbiter/lib
    install -d $pkgdir/usr/lib32


    install -m755 "$srcdir/arbiter" "$pkgdir/usr/share/arbiter/arbiter"

    install -m755 "$srcdir/libqt-mt.so.3.3" "$pkgdir/usr/share/arbiter/lib/libqt-mt.so.3.3"
    ln -s "libqt-mt.so.3.3" "$pkgdir/usr/share/arbiter/lib/libqt-mt.3"
    
    install -m755 "$srcdir/libqui.so.1.0" "$pkgdir/usr/share/arbiter/lib/libqui.so.1.0"
    ln -s "libqui.so.1.0" "$pkgdir/usr/share/arbiter/lib/libqui.1"

    install -m755 "$srcdir/libaudio.so.2" "$pkgdir/usr/lib32/libaudio.so.2"
    ln -s "libaudio.so.2" "$pkgdir/usr/lib32/libaudio.so"

    install -m755 "$srcdir/libjpeg.so.62" "$pkgdir/usr/lib32/libjpeg.so.62"
    # 为难 # libjpeg.so.8.2.2 was owned by lib32-libjpeg-turbo

    install -m755 "$srcdir/libpng12.so.0" "$pkgdir/usr/lib32/libpng12.so.0"
    ln -s "libpng12.so.0" "$pkgdir/usr/lib32/libpng12"

    install -m755 "$srcdir/libqt.so.3" "$pkgdir/usr/lib32/libqt.so.3"
    ln -s "libqt.so.3" "$pkgdir/usr/lib32/libqt.so"
    # 这年头没多少敢直接叫 libqt 的库了, conflict 自己认栽

    install -m755 "$srcdir/runarbiter.sh" "$pkgdir/usr/bin/arbiter"
}
