# Maintainer: JustKidding <jk@vin.ovh>

pkgname=avr-sim-bin
_pkgname=avr_sim
pkgver=2.6
pkgrel=1
pkgdesc="Gerd's avr simulator"
arch=(x86_64)
url="http://www.avr-asm-tutorial.net/avr_sim/index_en.html"
license=('unknown')
depends=('gtk2')
source=("http://www.avr-asm-tutorial.net/avr_sim/${pkgver/./}/avr_sim_${pkgver/./}_lin64.zip"
        "avr_sim.desktop")
sha256sums=("c959f5b6b4b18440eba293af7f6a3ad361637c7e23015c6b81c96dfdddfd3967"
            "62ccc4b2dfd899d13b143c36d56d43927c1a32741a6315bf632af159baa73ff8")

# append icons to source array
for size in 16 32 48 64 256; do
    source+=("${_pkgname}_${size}x${size}.png")
    sha256sums+=('SKIP')
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
