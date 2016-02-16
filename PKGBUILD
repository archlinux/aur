# Maintainer: Knight < echo YW5vbnltb3Vza25pZ2h0OTYrYXVyQGdtYWlsLmNvbQ== |base64 -d >

pkgname=cmd-markdown
_pkgname="${pkgname/-/_}"
pkgver=2.0
pkgrel=2
pkgdesc='An enhanced Markdown editor with MathJax, flowchart & sequence-diagram support'
arch=('x86_64' 'i686')
url='https://www.zybuluo.com/cmd'
license=('custom')
depends=('nss' 'gconf' 'libnotify' 'gtk2' 'alsa-lib' 'libxtst' 'libudev.so.0')
install="${pkgname}.install"
source=("${pkgname}.desktop")
source_x86_64=('http://static.zybuluo.com/cmd_markdown_linux64.tar.gz')
source_i686=('http://static.zybuluo.com/cmd_markdown_linux32.tar.gz')
md5sums=('c1596b758328bb4797d867dfdb7d2633')
md5sums_x86_64=('4d38b6773483db5d838a0cf6848ee34e')
md5sums_i686=('1c04488287f325a5051878c7cb4aef4c')
options=('!strip')

if [ "$CARCH" == "x86_64" ]; then
    DIR="${_pkgname}_linux64"
elif [ "$CARCH" == "i686" ]; then 
    DIR="${_pkgname}_linux32"
fi

prepare(){
    cd "$srcdir/$DIR"
    mv 'Cmd Markdown' Cmd-Markdown
    chmod 644 libffmpegsumo.so nw.pak icudtl.dat
}

package(){
    mkdir -p "$pkgdir/usr/share/applications"
    install -Dm644 "${pkgname}.desktop" "$pkgdir/usr/share/applications/"

    mkdir -p "$pkgdir/opt/$pkgname"
    cp -r "$DIR"/* "$pkgdir/opt/$pkgname"

    mkdir -p "$pkgdir/usr/bin"
    ln -s "/opt/$pkgname/Cmd-Markdown" "$pkgdir/usr/bin/$pkgname"
}
