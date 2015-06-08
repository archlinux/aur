# Maintainer: Knight < echo YW5vbnltb3Vza25pZ2h0OTYrYXVyQGdtYWlsLmNvbQ== |base64 -d >

pkgname=cmd-markdown
_pkgname="${pkgname/-/_}"
pkgver=1.1.0
pkgrel=1
pkgdesc='An enhanced Markdown editor with MathJax, flowchart & sequence-diagram support'
arch=('x86_64' 'i686')
url=('https://www.zybuluo.com/cmd')
license=('custom')
depends=('nss' 'gconf' 'libnotify' 'gtk2' 'alsa-lib' 'libxtst')
install="${pkgname}.install"
source=("${pkgname}.desktop")
source_x86_64=('http://home.ustc.edu.cn/~knight42/cmd_markdown_linux64.tar.gz')
source_i686=('http://home.ustc.edu.cn/~knight42/cmd_markdown_linux32.tar.gz')
md5sums=('c1596b758328bb4797d867dfdb7d2633')
md5sums_x86_64=('d9fa018bf3de63c09df600ed66023f6e')
md5sums_i686=('5bb1cdecdef76f29b422b274de5dbb49')
options=(!strip)

if [ "$CARCH" == "x86_64" ]; then
    DIR="${_pkgname}_linux64"
elif [ "$CARCH" == "i686" ]; then 
    DIR="${_pkgname}_linux32"
fi

prepare(){
    cd "$srcdir/$DIR"
    mv 'Cmd Markdown' Cmd-Markdown
    chmod 644 libffmpegsumo.so
}

package(){
    if [ ! -e /usr/lib/libudev.so.0 ]; then
        mkdir -p ${pkgdir}/usr/lib
        ln -s /usr/lib/libudev.so "${pkgdir}/usr/lib/libudev.so.0"
    fi

    mkdir -p "$pkgdir/usr/share/applications"
    install -Dm644 "${pkgname}.desktop" "$pkgdir/usr/share/applications/"

    mkdir -p "$pkgdir/opt/$pkgname"
    cp -r "$DIR"/* "$pkgdir/opt/$pkgname"

    mkdir -p "$pkgdir/usr/bin"
    ln -s "/opt/$pkgname/Cmd-Markdown" "$pkgdir/usr/bin/$pkgname"
}
