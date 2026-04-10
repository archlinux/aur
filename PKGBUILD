# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="jailer"
pkgver=16.12
pkgrel=1
pkgdesc="Database Subsetting and Relational Data Browsing Tool"
url="https://github.com/Wisser/Jailer"
license=("Apache-2.0")
arch=("x86_64")
depends=("glibc" "gcc-libs" "java-runtime" "libxi" "libxtst" "harfbuzz" "freetype2" "alsa-lib" "libpng" "libxext" "bash" "giflib" "libjpeg-turbo" "libx11" "libxrender" "lcms2" "zlib")
source=("${pkgname}-${pkgver}.deb::${url}/releases/download/v${pkgver}/jailer-database-tools_${pkgver}-x64.deb")
b2sums=('4bfc90a03f20b44b5b436933a3cdb32569f6d59aec58152c4e3227330638785b66fa6ab7d792f54e40b18910076cac64eb262a4360d357884b9b7ff990fbe9aa')

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
