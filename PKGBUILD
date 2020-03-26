# Maintainer: Svitozar Cherepii <razotivs@gmail.com>
pkgname=rvgl-bin
pkgver=20.0325
gamefilever=18.0328
pkgrel=1
pkgdesc="Rewrite of Re-Volt, popular 3D RC car racing game from 1999."
url='https://rvgl.re-volt.io'
arch=('x86_64')
license=('custom')
depends=('sdl2_image' 'openal' 'enet' 'libunistring')
optdepends=('rvgl-dcpack: dreamcast cars, rooftops track, box layout'
            'rvgl-soundtrack: community-made soundtrack'
            'rvgl-soundtrack-orig: dreamcast version original soundtrack'
            'libsndfile: for uncompressed audio support'
            'libvorbis: for OGG Vorbis support'
            'flac: for FLAC support'
            'mpg123: for MPEG support')
source=("game-files-$gamefilever.zip::https://distribute.re-volt.io/packs/game_files.zip"
        "rvgl-$pkgver.7z::https://rvgl.re-volt.io/downloads/rvgl_${pkgver}a_linux.7z"
        "rvgl.desktop")
sha256sums=('e6a6af46b96cfba9d74b0607de6c99a15f316ba7a7008d30197a9ee8b96e7fe3'
            'b3d520245b18aa136cafbde26902bfb3d52dc0cda9c1a8b674c026765647fa99'
            '4313552a067486339319e6e4b13386040183e196d7b6e26a1fec56a711e4721d')

package() {
    find cars edit gallery gfx levels licenses models redbook shaders \
        strings wavs gamecontrollerdb.txt game_gauge_replay.rpl -type f -exec \
        install -Dm644 {} "$pkgdir/opt/rvgl/{}" \;

    find profiles replays times -type d -exec \
        install -dm777 "$pkgdir/opt/rvgl/{}" \;

    for iconsize in 16x16 24x24 32x32 48x48 256x256
    do
        install -Dm644 "icons/$iconsize/apps/rvgl.png" \
            "$pkgdir/usr/share/icons/hicolor/$iconsize/apps/rvgl.png"
    done

    install -Dm755 "rvgl.64" "$pkgdir/opt/rvgl/rvgl"
    install -Dm644 "rvgl.desktop" "$pkgdir/usr/share/applications/rvgl.desktop"
}
