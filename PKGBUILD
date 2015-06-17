# Maintainer: Samuel Mesa samuelmesa@linuxmail.org 
# Maintainer: Bogusław Ciastek  sq5tb[at]tlen.pl

_progname="OpenJUMP"
pkgname=openjump-bin
pkgver=1.8.0
_pkgverf="${pkgver}-r4164-PLUS"
pkgrel=1
pkgdesc="Geographic Information System (GIS) written in the Java (binary version)"
arch=(any)
url="http://www.openjump.org/"
license=('GPL2')
groups=('science')
depends=('java-environment' 'bash')
install=openjump.install
changelog=ChangeLog
md5sums=('3c573c2e3cf43480aae490b143ddd2f2')

source=("$pkgname-$pkgver.zip::http://sourceforge.net/projects/jump-pilot/files/${_progname}/$pkgver/${_progname}-Portable-${_pkgverf}.zip/download")

package() {
    # unpack
    install -d "$pkgdir/opt"
    bsdtar --no-same-owner -xzvf $pkgname-$pkgver.zip -C "$pkgdir/opt"
    mv "$pkgdir/opt/${_progname}-${_pkgverf}" "$pkgdir/opt/${_progname}"

    rm $pkgdir/opt/${_progname}/bin/{oj_macosx.command,oj_windows.bat}

    # launcher
    install -d "$pkgdir/usr/bin"
    chmod a+x "$pkgdir/opt/${_progname}/bin/oj_linux.sh"
    ln -s "/opt/${_progname}/bin/oj_linux.sh" "$pkgdir/usr/bin/openjump"

    # icon
    install -d "$pkgdir/usr/share/applications/"
    echo "[Desktop Entry]
Name=${_progname}
Comment=Geographic Information System written in the Java
Exec=/opt/${_progname}/bin/oj_linux.sh
Icon=/opt/${_progname}/lib/icons/oj.png
Terminal=false
Type=Application
X-MultipleArgs=false
Categories=GTK;Science;" > "$pkgdir/usr/share/applications/${_progname}.desktop"

}


# vim:set ts=2 sw=2 et:
