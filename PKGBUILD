# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="jailer"
pkgver=17.1.4
pkgrel=1
pkgdesc="Database Subsetting and Relational Data Browsing Tool"
url="https://github.com/Wisser/Jailer"
license=("Apache-2.0")
arch=("x86_64")
depends=("glibc" "gcc-libs" "java-runtime" "libxi" "libxtst" "harfbuzz" "freetype2" "alsa-lib" "libpng" "libxext" "bash" "giflib" "libjpeg-turbo" "libx11" "libxrender" "lcms2" "zlib")
source=("${pkgname}-${pkgver}.deb::${url}/releases/download/v${pkgver}/jailer-database-tools_${pkgver}-x64.deb")
b2sums=('ed9c71b67873c67a1fc55e7f1283296819a6c94537438a9c356d538acad7af5425ac72995ea6e35b3a2f9d8b1057af105c1588e5453c1b7edd9ef8bd2b84d3ee')

prepare(){
 tar -xf "data.tar.zst"
 sed -i "opt/jailer-database-tools/lib/jailer-database-tools-Jailer_Database_Tools.desktop" \
     -e "s|Categories=Unknown|Categories=Development;|" \
     -e "s|Icon=.*|Icon=jailer|"
}

package(){
 install -d "${pkgdir}/usr"
 # not putting executables in /usr/bin because they require ../lib/app/jailer.cfg
 install -D -m 644 "opt/jailer-database-tools/lib/jailer-database-tools-Jailer_Database_Tools.desktop" "${pkgdir}/usr/share/applications/jailer.desktop"
 install -D -m 644 "opt/jailer-database-tools/lib/Jailer_Database_Tools.png" "${pkgdir}/usr/share/pixmaps/jailer.png"
 install -D -m 644 "opt/jailer-database-tools/share/doc/copyright" "${pkgdir}/usr/share/licenses/jailer/LICENSE"
 cp -r "opt" "${pkgdir}"
}
