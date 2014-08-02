# Maintainer: Thomas td123 Dziedzic <gostrc@gmail.com>
# Contributor: Ivan c00kiemon5ter Kanakarakis <ivan.kanak@gmail.com>
# Contributor: jht <stefano@inventati.org>

pkgname=clips
pkgver=6.24
pkgrel=3
pkgdesc='A Tool for Building Expert Systems'
arch=('i686' 'x86_64')
url="http://clipsrules.sourceforge.net/"
license=('custom')
depends=('termcap' 'libxaw' 'xbitmaps')
install='clips.install'
source=('http://downloads.sourceforge.net/clipsrules/clips_core_source_624.tar.Z'
        'http://downloads.sourceforge.net/clipsrules/x_windows_ide_source_624.tar.Z'
        'http://downloads.sourceforge.net/clipsrules/make_and_help_files_624.zip')
sha256sums=('80852a0df97597f710e90ca8bf5ecdc250c2034bf9dd3044bbedee111ad2e4ab'
            '66429eb818559323f5e90bd7b3c1e4f88af409a30a3433111a1d85bc7c789d09'
            '302712bbc2634cc437e6a7617d41ba54933ad6ffe5e01f0f869e9d7bc2cae9b8')

build() {
  cd ${pkgname}src/${pkgname}src

  cp -a ../../x-prjct/color/* .
  cp -a ../../x-prjct/makefile/* .
  cp -a ../../x-prjct/xinterface/* .

  make -f makefile.x

  make -f ../../makefile.gcc
}

package() {
  cd ${pkgname}src/${pkgname}src

  install -D -m755 xclips \
    ${pkgdir}/usr/bin/clips
  install -D -m755 clips \
    ${pkgdir}/usr/bin/clips-console
  install -D -m644 ../readme.txt \
    ${pkgdir}/usr/share/licenses/clips/LICENSE
}
