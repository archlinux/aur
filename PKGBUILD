# Maintainer: Your Name <tjmcgrew@gmail.com>
pkgname=famistudio-bin
_pkgname=FamiStudio
pkgver=3.2.1
pkgrel=1
epoch=
pkgdesc="A very simple music editor for the Nintendo Entertainment System or Famicom"
arch=(x86_64)
url="https://famistudio.org/"
license=('MIT')
groups=()
depends=(mono gtk-sharp-2 openal libcanberra ffmpeg)
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

md5sums=('ecf018cd5ab3fb1fb2c57d975d0c8799'
         '7cecbef97612ec8cf56a84e966382c87'
         'a1156aa440fcc359acc3d43dbfd2d6f9')
sha256sums=('cf2f139056b01cddf60fd3e5a3ef8a53e21cac4e91309b5246a8882397be1d67'
            '2c25b53b8a287ef5c29a1f32c32ad8cc56f093cb08f02cf0d09550a1bcd19537'
            'f8c86d1a851dd1321d3bf3ac3f704abc398d5297b620ef444d2eea0de5e58bf8')

validpgpkeys=()

package() {
    mkdir -p $pkgdir/usr/share/applications $pkgdir/usr/share/famistudio/ \
        $pkgdir/usr/bin
    cp famistudio.desktop $pkgdir/usr/share/applications/
    cp -Lr "Demo Songs" FamiStudio.exe FamiStudio.exe.config libNesSndEmu.so \
        libNotSoFatso.so libopenal32.so librtmidi.so libShineMp3.so libVorbis.so \
        LinuxReadme.txt OpenTK.dll Resources FamiStudio.svg \
        "$pkgdir/usr/share/famistudio"
    mkdir -p $pkgdir/usr/share/licenses/${pkgname}/
    cp LICENSE $pkgdir/usr/share/licenses/${pkgname}/
    echo -e "#\!/bin/sh\n\nmono /usr/share/famistudio/FamiStudio.exe \$*" > $pkgdir/usr/bin/famistudio
    chmod +x $pkgdir/usr/bin/famistudio
}
