# Maintainer: Mattia Moffa <mattia [at] moffa [dot] xyz>

pkgname=eclipse-cpp-bin
_pkgname=${pkgname%-bin}
epoch=2
pkgver=4.34
pkgrel=1
_release=2024-12/R
pkgdesc="Highly extensible IDE (C/C++ version)"
arch=('x86_64' 'aarch64')
url="https://www.eclipse.org/"
license=('EPL')
depends=('java-runtime>=21' webkit2gtk unzip)
makedepends=()
provides=(eclipse=$pkgver-$pkgrel)
conflicts=(eclipse)
options=(!strip)

_srcfilename_x86_64="$_pkgname-${_release//\//-}-linux-gtk-x86_64.tar.gz"
_srcfilename_aarch64="$_pkgname-${_release//\//-}-linux-gtk-aarch64.tar.gz"

source_x86_64=("$_srcfilename_x86_64::https://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/$_release/$_srcfilename_x86_64&r=1")
source_aarch64=("$_srcfilename_aarch64::https://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/$_release/$_srcfilename_aarch64&r=1")

sha512sums_x86_64=('0dccaeaad7bc70ce19cbb8ef164f86c66f01758b8b13c2794453a506c35d34ddfe162169d478c7319713fdea1ca234ae5fd97299c5fe07e1b331b2a6c3501267')
sha512sums_aarch64=('a7f28c0bd3c395c9936e3404d551a69924003dd58e33051510fce95d559cf709da78e9fe802bf7ca8c6b5935ba4d3619cf7c0ab43502645bae9482376305b67a')

source=("eclipse.desktop")
sha512sums=('96a532509459056c470e18bc5fde639cd9725b831ff69864a444ed8282dd87aefe71b23be92280f22a480f2321794c4e3f7b8026925fb03625f0bb954a06e139')

#backup=('usr/lib/eclipse/eclipse.ini')

package() {
    install -d "${pkgdir}/usr/lib"
    cp -r "eclipse" "${pkgdir}/usr/lib/eclipse"
    install -d "${pkgdir}/usr/bin"
    ln -s "/usr/lib/eclipse/eclipse" "${pkgdir}/usr/bin/eclipse"

    install -Dm644 "eclipse.desktop" "${pkgdir}/usr/share/applications/eclipse.desktop"

    for i in 16 22 24 32 48 64 128 256 512 1024 ; do
        install -Dm644 eclipse/plugins/org.eclipse.platform_${pkgver}*/eclipse$i.png \
            "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/eclipse.png"
    done
}
