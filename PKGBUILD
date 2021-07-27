# Maintainer: Axel Navarro <navarroaxel at gmail>
pkgname=intellij-idea-ce
_pkgname=idea-IC
_buildver=212.4746.92
pkgver=2021.2
pkgrel=1
pkgdesc="Intellij Idea IDE (community version) with Intellij JDK"
arch=('any')
options=(!strip)
url="http://www.jetbrains.com/idea/"
license=('Apache2')
depends=('giflib' 'libxtst')
source=("https://download.jetbrains.com/idea/ideaIC-${pkgver}.tar.gz"
        "intellij-idea-ce.desktop")
sha256sums=('7c27799861fb1ba0d43a3565a1ec2be789e1871191be709f0e79f1e17d3571fe'
            'b38188c0533db6861cf5193deebd58731ad93647ae3c03b3fae6f7748b4ff849')

package() {
    cd "$srcdir"
    mkdir -p "${pkgdir}/opt/${pkgname}"
    cp -R "${srcdir}/idea-IC-$_buildver/"* "${pkgdir}/opt/${pkgname}"
    if [[ $CARCH = 'i686' ]]; then
        rm -f "${pkgdir}/opt/${pkgname}/bin/libyjpagent-linux64.so"
        rm -f "${pkgdir}/opt/${pkgname}/bin/fsnotifier64"
    fi

    mkdir -p "${pkgdir}/usr/bin/"
    mkdir -p "${pkgdir}/usr/share/applications/"
    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -Dm 644 $pkgdir/opt/$pkgname/bin/idea.png $pkgdir/usr/share/pixmaps/$pkgname.png
    install -Dm644 "${startdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/"
    for i in $(ls $srcdir/idea-IC-$_buildver/license/ ); do
      ln -sf "/opt/${pkgname}/license/$i" "${pkgdir}/usr/share/licenses/${pkgname}/$i"
    done
    ln -s "/opt/${pkgname}/bin/idea.sh" "${pkgdir}/usr/bin/idea-ce"
}
