# Maintainer: Mattia Moffa <mattia [at] moffa [dot] xyz>

pkgname=eclipse-cpp
epoch=2
pkgver=4.31
pkgrel=1
_release=2024-03/R
pkgdesc="Highly extensible IDE (C/C++ version)"
arch=('x86_64' 'aarch64')
url="https://www.eclipse.org/"
license=('EPL')
depends=('java-runtime>=17' webkit2gtk unzip)
makedepends=()
provides=(eclipse=$pkgver-$pkgrel)
conflicts=(eclipse)

_srcfilename_x86_64="$pkgname-${_release//\//-}-linux-gtk-x86_64.tar.gz"
_srcfilename_aarch64="$pkgname-${_release//\//-}-linux-gtk-aarch64.tar.gz"

source_x86_64=("$_srcfilename_x86_64::https://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/$_release/$_srcfilename_x86_64&r=1")
source_aarch64=("$_srcfilename_aarch64::https://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/$_release/$_srcfilename_aarch64&r=1")

sha512sums_x86_64=('ebbde32b16fbd49716c3d5fef40fe6e510115f1698cf35f9fde23f11ba2be11a524d6e5179b15a1cf30af135b8f27a3efac301111b6160e6cdac9977a42082fd')
sha512sums_aarch64=('40a5b0f31de779579ccf39653fffd158fdf710b3a06340a81d018e9fbc1257ebd23f70a600838868e18b931a81b7bc8abe0974b0cb37a9eb08b9e6a143bc42f2')

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
