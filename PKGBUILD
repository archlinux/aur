# Maintainer: Estela <i at estela dot moe>
pkgbase=xcursor-samtoki-cursors
pkgname=(xcursor-samtoki-genshin-impact xcursor-samtoki-bocchi-the-rock)
pkgver=7.03
pkgrel=1
pkgdesc="A set of cursors by SamToki"
arch=('any')
depends=('libxcursor')
makedepends=('win2xcur') #AUR
license=('CC-BY-NC-SA-3.0')
_repo="Sam-Toki-Mouse-Cursors"
url="https://github.com/SamToki/${_repo}/"
source=("$url/archive/refs/tags/v${pkgver}.tar.gz"
"convert.sh"
"https://github.com/GNOME/adwaita-icon-theme/raw/refs/tags/48.0/Adwaita/cursors/text" # [BUG] the original text cursor is not visible
    "bocchi.sh"
    "furina.sh"
    "nahida.sh"
    "nijika.sh"
    "furina_lh.sh"
    "nahida_lh.sh"
    "bocchi_lh.sh"
    "nijika_lh.sh"
)
sha256sums=('ca4e969d4878950a63eabd71ad5aec60f10f199f588118f459189b0a4d95c5a4'
            'df576c27e2b497abfbb31808baca6c307c8d4514e80cddec0e357390c56a880b'
            '7ec54ff5b92fdbe65ced307272e839f4ae9a32ab4ea0f139daac781aa44bf05d'
            '830849882b9db9e155d27133daa770cb7cfed874dfeaa8e152933068b41e09d0'
            'd7d94744d54e57493f6ecf5bc591094a48bdf3085e953d1f9ccf46a3d9d868f6'
            'ac36d09ac7e0933e9fb8bd82c0e3ce56940c89213dbc4f762e534a35c98aef71'
            '52d77c6a52ae1bf5f190a432dac7c492b42f07bbb803547ca8a4764a97ddca96'
            'cfe34659df375a6510946919ad144a4137e1c321f97f5e0aedfda82bba6d2b05'
            '23f59630ae3110a62886618750578ec1c4308f5790cdffa0b81e9770b3c13cdb'
            '51d524ef29d6849ca65f241e6b6fa9122edcb89e22fb423e7d5ec2ceba7c3f10'
            'e5eaf7a80e190b33d89aa931e271b1707d3f5c3d12d328c52e2df524b933bd9d')
options=('!strip')

build() {
    cd "$srcdir"/${_repo}-$pkgver
    cp ../*.sh ./
    mkdir output
    win2xcur PROJECT/STMC/*.{ani,cur} -o output/
    cp ../text output/"STMC Common 06 Beam"
    confs=(
        "bocchi"
        "bocchi_lh"
        "nijika"
        "nijika_lh"
        "furina"
        "furina_lh"
        "nahida"
        "nahida_lh"
    )
    for conf in "${confs[@]}"; do
        bash convert.sh $conf
    done
}

package_xcursor-samtoki-genshin-impact() {
    pkgdesc="A set of cursors featuring Nahida and Furina of Genshin Impact"
    conflicts=('xcursor-genshin-nahida')
    provides=('xcursor-genshin-nahida')
    replaces=('xcursor-genshin-nahida')
    cd "$srcdir"/${_repo}-$pkgver
    confs=(
        "furina"
        "furina_lh"
        "nahida"
        "nahida_lh"
    )
    for conf in "${confs[@]}"; do
        install -Dm644 "${conf}/index.theme" "${pkgdir}/usr/share/icons/${conf}/index.theme"
        
        install -Dm644 -t "${pkgdir}/usr/share/icons/${conf}/cursors/" "${conf}/cursors/"*
    done
}

package_xcursor-samtoki-bocchi-the-rock() {
    pkgdesc="A set of cursors featuring Bocchi the Rock!"
    cd "$srcdir"/${_repo}-$pkgver
    confs=(
        "bocchi"
        "bocchi_lh"
        "nijika"
        "nijika_lh"
    )
    for conf in "${confs[@]}"; do
        install -Dm644 "${conf}/index.theme" "${pkgdir}/usr/share/icons/${conf}/index.theme"
        install -Dm644 -t "${pkgdir}/usr/share/icons/${conf}/cursors/" "${conf}/cursors/"*
    done
}
