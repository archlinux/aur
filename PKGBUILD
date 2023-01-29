# Maintainer: LordDemecrius83 <lorddemecrius83@proton.me>
# Contributor: sQVe <oskargrunning@gmail.com>

pkgname=vimix-gtk-themes-git
pkgver=r520.016b12dc
pkgrel=1
pkgdesc='A flat Material Design theme for GTK 3, GTK 2 and Gnome-Shell'
url='https://github.com/vinceliuice/vimix-gtk-themes'
arch=('any')
license=('GPL3')
depends=('gtk3')
optdepends=('gtk-engine-murrine: for gtk2 themes'
            'gtk-engines: for gtk2 themes')
makedepends=('git' 'sassc')
source=('git+https://github.com/vinceliuice/vimix-gtk-themes.git')
sha256sums=('SKIP')
provides=("vimix-gtk-themes=${pkgver}")
options=(!strip)
conflicts=('vimix-gtk-themes')
_gitname=vimix-gtk-themes

pkgver() {
    cd "${_gitname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${_gitname}"
    install -dm755 "${pkgdir}/usr/share/themes"

    # Install standard sizes.
    ./install.sh --theme all --size standard --dest "$pkgdir/usr/share/themes"

    # Install compact sizes.
    ./install.sh --theme all --size compact --dest "$pkgdir/usr/share/themes"
}
