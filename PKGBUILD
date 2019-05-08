# Maintainer: Svitozar Cherepii <razotivs@gmail.com>
pkgname=rvgl-dcpack
pkgver=18.1126
pkgrel=2
pkgdesc="RVGL dreamcast content pack."
url='https://rvgl.re-volt.io'
arch=('any')
license=('custom')
depends=('rvgl-bin')
source=("https://distribute.re-volt.io/packs/rvgl_dcpack.zip"
        "https://distribute.re-volt.io/releases/rvgl_dcpack.txt")
sha256sums=('6f46b46715dfcebc531dd658169b17580b00c5c3a5bc3462aad190a1b92f435c'
            'SKIP')

pkgver() {
    cat rvgl_dcpack.txt
}

package() {
    # Enable dreamcast car selection box layout
    # for file in frontend.fin frontend.fob
    # do
    #     mv levels/frontend/custom/dc/$file levels/frontend/custom
    # done

    # Remove conflicting files shipped with game
    rm gfx/roof.bmp gfx/roof.bmq # levels/frontend/frontend.fob

    # Add BigVolt and BossVolt to default car selection box layout
    mv levels/frontend/frontend.fob levels/frontend/custom

    find cars gfx levels models wavs -type f -exec \
        install -Dm644 {} "$pkgdir/opt/rvgl/{}" \;
}
