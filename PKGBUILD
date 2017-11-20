# Maintainer: levinit <levinit at outlook>

pkgname=moedict
_pkgname=moedict-desktop
pkgver=1.1.1
pkgrel=1
pkgdesc="Chinese Dictionary漢語詞典-萌典/mengdian"
arch=('i686' 'x86_64')
url="https://racklin.github.io/moedict-desktop/download.html"
license=('GPL')
makedepends=('git')

source_common="https://github.com/racklin/moedict-desktop/releases/download/$pkgver/$_pkgname.app-$pkgver-linux"
source_x86_64=("$source_common-${arch[1]}.tar.bz2")
source_i686=("$source_common-${arch[0]}.tar.bz2")
md5sums_x86_64=('SKIP')
md5sums_i686=('SKIP')

package() {
    install -dm755 "$pkgdir/opt"
    install -dm755 "$pkgdir/usr/share/icons"
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/share/applications"
    
    #according to different architectures
    thisArch=`uname -m`
    if [[ $thisArch == ${arch[1]} ]]
    then
        #copy app files
        cp -r "$srcdir/$_pkgname.app-linux-${arch[1]}" "$pkgdir/opt/$pkgname"
        #create application desktop icon
        cp "$srcdir/$_pkgname.app-linux-${arch[1]}/extensions/moedict-addon-app@moedict.tw/webapp/icon.png" "$pkgdir/usr/share/icons/moedict.png"
    else
        cp -r"$srcdir/$_pkgname.app-linux-${arch[0]}" "$pkgdir/opt/$pkgname"
        cp "$srcdir/$_pkgname.app-linux-${arch[0]}/extensions/moedict-addon-app@moedict.tw/webapp/icon.png" "$pkgdir/usr/share/icons/moedict.png"
    fi
    
    #create a shell script for launching app
    echo -e '#!/bin/sh\n/opt/moedict/Moedict-Desktop-bin &' > "$pkgdir/usr/bin/moedict"
    chmod +x "$pkgdir/usr/bin/moedict"
    
    #create application desktop file"
    echo -e '[Desktop Entry]\nName=萌典\nName[en_US]=moedict\nComment=漢語詞典\nComment[zh_CN]=汉语词典\nComment[zh_SG]=汉语词典\nComment[zh_TW]=漢語詞典\nComment[zh_HK]=漢語詞典\nComment[yue_HK]=漢語詞典\nComment[en_US]=Chinese Dictionary\nIcon=moedict\nExec=moedict\nType=Application\nTerminal=false\nCategories=Office;Dictionary' > "$pkgdir/usr/share/applications/moedict.desktop"
    echo "文件較大，請耐心等待。Please wait..."
}
