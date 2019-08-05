# Maintainer: Johannes Graën <johannes SPIRALGALAXY selfnet FULLSTOP de>

# This PKGBUILD is based on the packages jabref and jabref-git

pkgname=jabref-latest
pkgver=20190527
pkgrel=1
pkgdesc="GUI frontend for BibTeX, written in Java; latest master version from git"
arch=('any')
url="https://www.jabref.org/"
license=('MIT')
provides=('jabref')
conflicts=('jabref')
depends=('archlinux-java-run>=4' 'java8-openjfx'
         'sh'
         'atk'
         'bzip2'
         'cairo'
         'expat'
         'fontconfig'
         'freetype2'
         'fribidi'
         'gcc-libs'
         'gdk-pixbuf2'
         'glib2'
         'glibc'
         'graphite'
         'gtk2'
         'harfbuzz'
         'libdatrie'
         'libffi'
         'libpng'
         'libthai'
         'libutil-linux'
         'libx11'
         'libxau'
         'libxcb'
         'libxcomposite'
         'libxcursor'
         'libxdamage'
         'libxdmcp'
         'libxext'
         'libxfixes'
         'libxi'
         'libxinerama'
         'libxrandr'
         'libxrender'
         'libxtst'
         'pango'
         'pcre'
         'pixman'
         'zlib'
)
optdepends=('gsettings-desktop-schemas: For web search support')
source=(https://builds.jabref.org/master/JabRef--master--latest.jar
        https://raw.githubusercontent.com/JabRef/jabref/master/LICENSE.md
        jabref.sh
        jabref.desktop)
noextract=(JabRef--master--latest.jar)
sha256sums=('SKIP'
            'dad0a06f54ce346cc066c6e27e746974e850b77f04381f3c363021ee927e444d'
            'b51970cc3b70da835f7ebc971d03570417dba7dae837f28f2cce213ecb844768'
            'a26845ba60ef2588c52d7d18259a977b146c777f935573bacdffcdcefa2b41b5')

pkgver() {
  curl --silent --head head https://builds.jabref.org/master/JabRef--master--latest.jar \
  | grep "Last-Modified" | cut -d' ' -f2- | date -f - +%Y%m%d
}

prepare() {
  cd ${srcdir}
  bsdtar -xf JabRef--master--latest.jar icons/jabref.svg
}

package() {
  cd ${srcdir}
  install -Dm755 JabRef--master--latest.jar ${pkgdir}/usr/share/java/${pkgname}/JabRef-${pkgver}.jar

  install -Dm755 jabref.sh ${pkgdir}/usr/bin/jabref
  sed -i "s/VERSION/${pkgver}/" ${pkgdir}/usr/bin/jabref

  install -Dm644 jabref.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
  install -Dm644 icons/jabref.svg ${pkgdir}/usr/share/pixmaps/${pkgname}.svg
  install -Dm644 LICENSE.md ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md
}
