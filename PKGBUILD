#Maintainer: Adrian Freund <adrian@freund.io>

pkgbase=plymouth-themes-adi1090x-pack4-git
_themenames=('red_loader'
'rings'
'rings_2'
'rog'
'rog_2'
'seal'
'seal_2'
'seal_3'
'sliced'
'sphere'
'spin'
'spinner_alt'
'splash'
'square'
'square_hud'
'target'
'target_2'
'tech_a'
'tech_b'
'unrap')

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
    cd \$srcdir/plymouth-themes/pack_4/$themename
    mkdir -p \$pkgdir/usr/share/plymouth/themes/$themename
    find . -type f -exec install -Dm644 \"{}\" \"\${pkgdir}\"/usr/share/plymouth/themes/$themename/\"{}\" \\;
}
"
done
