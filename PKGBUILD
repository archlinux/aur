# Maintainer: Jack Chen <redchenjs@live.com>

pkgname=360zip
pkgver=1.0.0.1010
pkgrel=3
pkgdesc='360 Archiving Tool'
arch=('x86_64')
url='http://yasuo.360.cn/'
license=('custom')
makedepends=(
    'imagemagick'
)
depends=(
    'qt5-base'
)
source=(
    'https://packages.deepin.com/deepin/pool/non-free/3/360zip/360zip_1.0.0.1010_amd64.deb'
)
md5sums=(
    'b368ad91d6c3667a6b3cdead857a90c9'
)

package() {
    tar -xf ${srcdir}/data.tar.xz -C ${pkgdir}/

    mv ${pkgdir}/usr/lib/x86_64-linux-gnu/* ${pkgdir}/usr/lib/
    rmdir ${pkgdir}/usr/lib/x86_64-linux-gnu/

    mkdir ${pkgdir}/usr/local/bin/
    ln -s /usr/local/share/360zip/360zip.sh ${pkgdir}/usr/local/bin/360zip

    for i in 16x16 22x22 24x24 32x32 48x48 64x64 128x128 256x256; do
        convert -adaptive-resize $i ${pkgdir}/usr/local/share/icons/360zip.png \
                                    ${pkgdir}/usr/local/share/icons/360zip_$1.png
        install -Dm644 ${pkgdir}/usr/local/share/icons/360zip_$1.png \
                       ${pkgdir}/usr/share/icons/hicolor/$i/apps/360zip.png
        rm ${pkgdir}/usr/local/share/icons/360zip_$1.png
    done
}
