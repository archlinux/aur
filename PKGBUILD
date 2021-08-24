# Maintainer: Mattia Moffa <mattia [at] moffa [dot] xyz>

pkgname=eclipse-cpp
epoch=2
pkgver=4.20
pkgrel=1
_release=2021-06/R
pkgdesc="Highly extensible IDE (C/C++ version)"
arch=(x86_64)
url="https://www.eclipse.org/"
license=('EPL')
depends=('java-environment>=11' webkit2gtk unzip)
makedepends=()
provides=(eclipse=$pkgver-$pkgrel)
conflicts=(eclipse)

_srcfilename="$pkgname-${_release//\//-}-linux-gtk-$CARCH.tar.gz"
source=("$_srcfilename::https://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/$_release/$_srcfilename&r=1"
        "eclipse.desktop")
sha512sums=('ff3038cdc15cc6a43b9d374f2035cea59209ee0b46a3f45ff99af22899240ff5f8898eb3b77eb0ee122f10307602ee3963d3417f1af86f1fb7af9d0d8a47fcde'
            '96a532509459056c470e18bc5fde639cd9725b831ff69864a444ed8282dd87aefe71b23be92280f22a480f2321794c4e3f7b8026925fb03625f0bb954a06e139')

package() {
    install -d "${pkgdir}/usr/lib"
    cp -r "eclipse" "${pkgdir}/usr/lib/eclipse"
    install -d "${pkgdir}/usr/bin"
    ln -s "/usr/lib/eclipse/eclipse" "${pkgdir}/usr/bin/eclipse"

    install -Dm644 "eclipse.desktop" "${pkgdir}/usr/share/applications/eclipse.desktop"

    for i in 16 22 24 32 48 64 128 256 512 1024 ; do
        install -Dm644 eclipse/plugins/org.eclipse.platform_*/eclipse$i.png \
            "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/eclipse.png"
    done
}
