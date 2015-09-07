# Maintainer: Vanitas <ssbianjp [AT] gmail.com>
# Contributor: Jove Yu <yushijun110 [AT] gmail.com>
# Contributor: csslayer <wengxt [AT] gmail.com>
# Contributor: Felix Yan <felixonmars [AT] gmail.com>
pkgbase=sogou
pkgname=sogou
pkgver=1.2.0.0056
pkgrel=1
pkgdesc="Sogou Pinyin for Linux"
arch=('x86_64' 'i686')
url="http://pinyin.sogou.com/linux/"
license=('custom')
depends=('fcitx' 'opencc' 'libidn' 'fcitx-qt4' 'lsb-release' 'xorg-xprop')

if [ "${CARCH}" = "i686" ]; then
    _LIB_DIR=i386-linux-gnu
    _ARCH=i386
    _time=1432524151

else
    _LIB_DIR=x86_64-linux-gnu
    _ARCH=amd64
    _time=1432523940
fi

source=("http://download.ime.sogou.com/${_time}/sogoupinyin_${pkgver}_${_ARCH}.deb"
        "http://7xizf7.com1.z0.glb.clouddn.com/sogou-autostart"
        "http://7xizf7.com1.z0.glb.clouddn.com/fcitx-qimpanel.real"
	    "http://7xizf7.com1.z0.glb.clouddn.com/fcitx-qimpanel")
md5sums=('47cd879b6b340391705f9a4e389045d9'
         '60b1dcd637c932cf4f3bfaed797f5401'
         'b55df1dffa61fb1af40199a8e1b2244b'
         '62b2b974c475bab9f6cf6d5ee83b984a')
package(){
    cd ${srcdir}

    tar xJvf data.tar.xz -C "${pkgdir}"

    mv "$pkgdir"/usr/lib/{$_LIB_DIR/,}fcitx
    rmdir "$pkgdir/usr/lib/${_LIB_DIR}"

    rm -r "$pkgdir"/usr/share/keyrings

    ln -s /usr/lib/libopencc.so "$pkgdir"/usr/lib/libopencc.so.1
	 install -m755 fcitx-qimpanel.real "$pkgdir"/usr/bin
	install -m755 fcitx-qimpanel "$pkgdir"/usr/bin
    install -m755 sogou-autostart "$pkgdir"/usr/bin

    rm "$pkgdir"/etc/xdg/autostart/fcitx-ui-sogou-qimpanel.desktop
    cp "$pkgdir"/usr/share/applications/fcitx-ui-sogou-qimpanel.desktop "$pkgdir"/etc/xdg/autostart/fcitx-ui-sogou-qimpanel.desktop
    sed -i 's/sogou-qimpanel\ %U/sogou-autostart/g' "$pkgdir"/etc/xdg/autostart/fcitx-ui-sogou-qimpanel.desktop
}
