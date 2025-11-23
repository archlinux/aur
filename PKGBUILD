# Maintainer: Your Name <tjmcgrew@gmail.com>
pkgname=famistudio-bin
_pkgname=FamiStudio
pkgver=4.4.4
pkgrel=1
epoch=
pkgdesc="A very simple music editor for the Nintendo Entertainment System or Famicom"
arch=(x86_64)
url="https://famistudio.org/"
license=('MIT')
groups=()
depends=(dotnet-runtime-8.0 dotnet-runtime-8.0 openal libcanberra ffmpeg)
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=(famistudio)
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/BleuBleu/FamiStudio/releases/download/$pkgver/$_pkgname${pkgver//\./}-LinuxAMD64.zip"
    "famistudio.desktop" "FamiStudio.svg")
noextract=()

md5sums=('bda88b9f7c39ce388b9921c348955733'
         '7cecbef97612ec8cf56a84e966382c87'
         'a1156aa440fcc359acc3d43dbfd2d6f9')
sha256sums=('2129eef99c44875c8ca34968132eeecabc7463ac5c9fccee693bf63cc1f78b0c'
            '2c25b53b8a287ef5c29a1f32c32ad8cc56f093cb08f02cf0d09550a1bcd19537'
            'f8c86d1a851dd1321d3bf3ac3f704abc398d5297b620ef444d2eea0de5e58bf8')
validpgpkeys=()

package() {
    mkdir -p $pkgdir/usr/share/applications $pkgdir/usr/share/famistudio/ \
        $pkgdir/usr/bin
    cp famistudio.desktop $pkgdir/usr/share/applications/

    cp -Lr "Demo Songs" Localization FamiStudio.dll FamiStudio.runtimeconfig.json \
        libNesSndEmu.so libStb.so \
        libNotSoFatso.so libopenal32.so librtmidi.so libShineMp3.so libVorbis.so \
        libglfw.so libGifDec.so LinuxReadme.txt FamiStudio.svg \
        "$pkgdir/usr/share/famistudio"
    mkdir -p $pkgdir/usr/share/licenses/${pkgname}/
    cp LICENSE $pkgdir/usr/share/licenses/${pkgname}/
    echo -e "#!/bin/sh\n\ndotnet /usr/share/famistudio/FamiStudio.dll \$*" > $pkgdir/usr/bin/famistudio
    chmod +x $pkgdir/usr/bin/famistudio
}
