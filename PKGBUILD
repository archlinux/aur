# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="jailer"
pkgver=16.10
pkgrel=1
pkgdesc="Database Subsetting and Relational Data Browsing Tool"
url="https://github.com/Wisser/Jailer"
license=("Apache-2.0")
arch=("x86_64")
depends=("glibc" "gcc-libs" "java-runtime" "libxi" "libxtst" "harfbuzz" "freetype2" "alsa-lib" "libpng" "libxext" "bash" "giflib" "libjpeg-turbo" "libx11" "libxrender" "lcms2" "zlib")
source=("${pkgname}-${pkgver}.deb::${url}/releases/download/v${pkgver}/jailer-database-tools_${pkgver}-x64.deb")
b2sums=('23d68e1ad6378451499503b054d60c1dacb3105f1282731f5ec8675ed99c45d42f4c7c7fdee9781578bda6046df8a92ad74604ade704f3ea3f4c090dd259a0bc')

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
