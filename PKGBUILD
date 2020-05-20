# Maintainer: Huki <gk7huki@gmail.com>
# Contributor: Svitozar Cherepii <razotivs@gmail.com>

pkgname=rvgl-bin
pkgver=20.0430
gamefilesver=18.0328
pkgrel=3
pkgdesc="Rewrite of Re-Volt, popular 3D RC car racing game from 1999."
url='https://rvgl.re-volt.io'
arch=('x86_64')
license=('custom')
depends=('sdl2' 'sdl2_image' 'openal' 'enet' 'libunistring')
optdepends=('rvgl-dcpack: dreamcast content pack'
            'rvgl-soundtrack: community-made soundtrack'
            'rvgl-soundtrack-orig: original dreamcast soundtrack'
            'libsndfile: for uncompressed audio support'
            'libvorbis: for OGG Vorbis support'
            'flac: for FLAC support'
            'mpg123: for MPEG support')
source=("game_files.zip::https://distribute.re-volt.io/packs/game_files.zip"
        "rvgl_common.zip::https://distribute.re-volt.io/packs/rvgl_common.zip"
        "rvgl_linux.zip::https://distribute.re-volt.io/packs/rvgl_linux.zip"
        "RVGL.desktop")
sha256sums=('b29593305de32dc6baa6a67eed7de60822ca6cfab7f465437d11f665b5f64285'
            '367bdee50d9e5998ad7eae549d411fe7dd2d29301350ac662da15f7682ad6aca'
            '767f8f8a965e9b43a8e525c66a5041fbef1be0cdeb6b5e45809d8905a943c41c'
            '4313552a067486339319e6e4b13386040183e196d7b6e26a1fec56a711e4721d')

package() {
    find cars edit gallery gfx levels licenses models shaders strings wavs \
        gamecontrollerdb.txt game_gauge_replay.rpl rvgl_changelog.txt \
        -type f -exec install -Dm644 {} "$pkgdir/opt/rvgl/{}" \;

    find profiles replays times -type d -exec \
        install -dm777 "$pkgdir/opt/rvgl/{}" \;

    for iconsize in 16x16 24x24 32x32 48x48 256x256
    do
        install -Dm644 "icons/$iconsize/apps/rvgl.png" \
            "$pkgdir/usr/share/icons/hicolor/$iconsize/apps/rvgl.png"
    done

    install -Dm755 "rvgl.64" "$pkgdir/opt/rvgl/rvgl"
    install -Dm644 "RVGL.desktop" "$pkgdir/usr/share/applications/RVGL.desktop"
}
