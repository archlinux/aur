#Maintainer: Adrian Freund <adrian@freund.io>

pkgbase=plymouth-themes-adi1090x-pack2-git
_themenames=('cyanide'
'cybernetic'
'dark_planet'
'darth_vader'
'deus_ex'
'dna'
'double'
'dragon'
'flame'
'glitch'
'glowing'
'green_blocks'
'green_loader'
'hexagon'
'hexagon_2'
'hexagon_alt'
'hexagon_dots'
'hexagon_dots_alt'
'hexagon_hud'
'hexagon_red')

pkgname=() #initialized by loop at the bottom
pkgver=r28.32a0d92
pkgrel=1
pkgdesc="The plymouth theme collection by adi1090x"
arch=('any')
url="https://github.com/adi1090x/plymouth-themes"
license=('GPL')
depends=('plymouth')

source=("git+https://github.com/adi1090x/plymouth-themes.git")
md5sums=('SKIP')

pkgver() {
  cd "plymouth-themes"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

for themename in ${_themenames[*]}
do
    pkgname+=("plymouth-theme-${themename//_/-}-git")
    eval "
package_plymouth-theme-${themename//_/-}-git() {
    cd \$srcdir/plymouth-themes/pack_2/$themename
    mkdir -p \$pkgdir/usr/share/plymouth/themes/$themename
    find . -type f -exec install -Dm644 \"{}\" \"\${pkgdir}\"/usr/share/plymouth/themes/$themename/\"{}\" \\;
}
"
done
