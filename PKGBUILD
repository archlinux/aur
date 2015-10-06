# Maintainer:maz-1 <loveayawaka at gmail dot com>

pkgname=flv-extract
pkgver=2.1.0.2
pkgrel=1
pkgdesc='Front-end FLV extract and mp4/mkv remuxing GUI software.'
arch=('any')
url='https://code.google.com/p/flv-extraxct/'
license=('Other')
depends=('mono')
source=(
    "https://github.com/maz-1/flv-extraxct/raw/master/bin/Release/FLVExtract.exe"
    "https://github.com/maz-1/flv-extraxct/raw/master/FLVExtractCL/bin/Release/FLVExtractCL.exe"
    "flv-extract.desktop"
)
md5sums=('30de5eb15c89bb7a28a363236efc2bf5'
         '132f4cf02d9a4cce3935eda733721c1c'
         '8c5dd0ac900214f3e4900d1fb3af1394')

package() {
    cd "${srcdir}"
    install -dm 755 ${pkgdir}/usr/{bin,share/applications,share/flv-extract}
    install -Dm644 FLVExtract.exe   $pkgdir/usr/share/flv-extract/FLVExtract.exe
    install -Dm644 FLVExtractCL.exe $pkgdir/usr/share/flv-extract/FLVExtractCL.exe
    install -Dm755 flv-extract.desktop $pkgdir/usr/share/applications/flv-extract.desktop
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
}



