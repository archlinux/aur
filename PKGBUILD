# Maintainer: Axel Navarro <navarroaxel at gmail>
pkgname=intellij-idea-ce
_pkgname=idea-IC
pkgver=2023.2.2
_pkgver=232.9921.47
pkgrel=1
pkgdesc="An intelligent IDE for Java, Groovy and other programming languages with advanced refactoring features intensely focused on developer productivity."
arch=('any')
options=(!strip)
url="http://www.jetbrains.com/idea/"
license=('Apache2')
depends=('giflib' 'libxtst')
source=("https://download.jetbrains.com/idea/ideaIC-${pkgver}.tar.gz"
        "intellij-idea-ce.desktop")
sha256sums=('cf647137394e27b3011072e463dc2e4bcdd54dc6ea9406e487a47648fc77bd26'
            '1351b249a62104444362b1b29b9c82ea50bcdf44f84fa81bb39197d7a4e3fa67')

package() {
    cd "$srcdir"
    mkdir -p "${pkgdir}/opt/${pkgname}"
    cp -R "${srcdir}/idea-IC-$_pkgver/"* "${pkgdir}/opt/${pkgname}"
    if [[ $CARCH = 'i686' ]]; then
        rm -f "${pkgdir}/opt/${pkgname}/bin/libyjpagent-linux64.so"
        rm -f "${pkgdir}/opt/${pkgname}/bin/fsnotifier64"
    fi

    mkdir -p "${pkgdir}/usr/bin/"
    mkdir -p "${pkgdir}/usr/share/applications/"
    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -Dm 644 $pkgdir/opt/$pkgname/bin/idea.png $pkgdir/usr/share/pixmaps/$pkgname.png
    install -Dm644 "${startdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/"
    for i in $(ls $srcdir/idea-IC-$_pkgver/license/ ); do
      ln -sf "/opt/${pkgname}/license/$i" "${pkgdir}/usr/share/licenses/${pkgname}/$i"
    done
    ln -s "/opt/${pkgname}/bin/idea.sh" "${pkgdir}/usr/bin/idea-ce"
}
