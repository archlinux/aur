# Maintainer:maz-1 <loveayawaka at gmail dot com>

pkgname=flv-extract
pkgver=2.1.0.2
pkgrel=2
pkgdesc='Front-end FLV extract and mp4/mkv remuxing GUI software.'
arch=('any')
url='https://code.google.com/p/flv-extraxct/'
license=('Other')
depends=('mono')
optdepends=('gpac' 'mkvtoolnix-cli')
source=(
    "https://github.com/maz-1/flv-extraxct/raw/master/bin/Release/FLVExtract.exe"
    "https://github.com/maz-1/flv-extraxct/raw/master/FLVExtractCL/bin/Release/FLVExtractCL.exe"
    "flv-extract.desktop"
    "Rewrite.png"
)
md5sums=('3832c81f73805ed71d58406811a9f4c2'
         'e7785cf3b2ace12258fd354e04986055'
         '1154329f0dda79902f722f6991d13be8'
         'ed0bd9b9898b78bf0e0e98ddff70a3c2')

package() {
    cd "${srcdir}"
    install -dm 755 ${pkgdir}/usr/{bin,share/applications,share/flv-extract}
    install -Dm644 FLVExtract.exe   $pkgdir/usr/share/flv-extract/FLVExtract.exe
    install -Dm644 FLVExtractCL.exe $pkgdir/usr/share/flv-extract/FLVExtractCL.exe
    install -Dm755 flv-extract.desktop $pkgdir/usr/share/applications/flv-extract.desktop
    install -Dm644 Rewrite.png $pkgdir/usr/share/pixmaps/flv-extract.png
    echo '#!/bin/sh' | tee $pkgdir/usr/bin/{FLVExtract,FLVExtractCL} 
    echo 'mono /usr/share/flv-extract/FLVExtract.exe "$@"' >> $pkgdir/usr/bin/FLVExtract
    echo 'mono /usr/share/flv-extract/FLVExtractCL.exe "$@"' >> $pkgdir/usr/bin/FLVExtractCL
    chmod +x $pkgdir/usr/bin/*
    ln -s /usr/bin/FLVExtract $pkgdir/usr/bin/flvextract
    ln -s /usr/bin/FLVExtractCL $pkgdir/usr/bin/flvextractcl
    echo '#!/bin/sh' | tee $pkgdir/usr/share/flv-extract/{mkvmerge.exe,MP4Box.exe}
    echo 'exec mkvmerge "$@"' >> $pkgdir/usr/share/flv-extract/mkvmerge.exe
    echo 'exec MP4Box "$@"' >> $pkgdir/usr/share/flv-extract/MP4Box.exe
    chmod +x $pkgdir/usr/share/flv-extract/{mkvmerge,MP4Box}.exe
    touch $pkgdir/usr/share/flv-extract/js32.dll
}



