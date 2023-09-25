# Maintainer: JustKidding <jk@vin.ovh>

pkgname=avr-sim-bin
_pkgname=avr_sim
pkgver=2.8
pkgrel=1
pkgdesc="Gerd's avr simulator"
arch=(x86_64)
url="http://www.avr-asm-tutorial.net/avr_sim/index_en.html"
license=('unknown')
depends=('gtk2')
source=("http://www.avr-asm-tutorial.net/avr_sim/${pkgver/./}/avr_sim_${pkgver/./}_lin64.zip"
        "avr_sim.desktop")
sha256sums=('fb5201676e7ee64865d890469b9cc73af9478319e4c1442abeb1e451895351fa'
            '62ccc4b2dfd899d13b143c36d56d43927c1a32741a6315bf632af159baa73ff8'
            '728f09f142be88608abe17101a641aad5c04e4e023f1dd3b4c87be6072d91fe2'
            'd96a32be5acdb94268966e15c412926b4888cefc0a20e77fc16a44882810aaf4'
            '28496dd429cb833e917310fde3abcdfa3610d11cf0a1f7028ef99bedb6b661db'
            'b92cb2fbee37c11e053cec9d5347e9618eb91c11527e9e0a28f4264ec43992de'
            'f015b905a6bcee09ce85cb91fa9f28a24a5b22915ea4b8674e771730d523d9d8')

# append icons to source array
for size in 16 32 48 64 256; do
    source+=("${_pkgname}_${size}x${size}.png")
done

package() {
    cd "$srcdir"

    install -D avr_sim "$pkgdir/usr/bin/avr_sim"
    
    install -Dm644 avr_sim.desktop "$pkgdir/usr/share/applications/avr_sim.desktop"

    for size in 16 32 48 64 256; do
        install -Dm644 "${_pkgname}_${size}x${size}.png" \
            "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/${_pkgname}.png"
    done
}
