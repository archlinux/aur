# Maintainer: NicoHood <archlinux {cat} nicohood {dog} de>
# PGP ID: 97312D5EB9D7AE7D0BD4307351DAE9B7C1AE9161
# Contributor: ELmoussaoui Bilal <bil.elmoussaoui@gmail.com>

pkgname=arc-icon-theme
pkgver=20161122
pkgrel=3
pkgdesc='Arc icon theme. Official releases only.'
arch=('any')
url="https://github.com/horst3180/arc-icon-theme"
license=('GPL3')
depends=('gtk-update-icon-cache' 'hicolor-icon-theme')
optdepends=( #'moka-icon-theme-git: Arc icon theme was built to be used on top of Moka icon theme'
             #'faba-icon-theme: Smaller version of moka with no application icons'
            'elementary-icon-theme: Secondary icon theme fallback'
            'arc-gtk-theme: gtk theme of arc')
options=('!emptydirs' '!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/horst3180/${pkgname}/archive/${pkgver}.tar.gz"
        "${pkgname}-${pkgver}.tar.gz.sig::https://github.com/horst3180/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz.asc")
validpgpkeys=('A46FD8E741A2A075898462CDC57DFF0D28DAAE97')
sha512sums=('5d0f1417358eb81994868949acefe146537d8f3cc2fd7f529f9e6ba9c264845e50962f94427bac1262a76d3ca98d05795819d7c4a6ecd3139b0b57a6e9fdfad1'
            'SKIP')
prepare() {
    # Add moka, faba and elementary theme as fallback theme
    cd "${srcdir}/${pkgname}-${pkgver}"
    sed -i "s/Inherits=.*/Inherits=Moka,Faba,elementary,Adwaita,gnome,hicolor/" Arc/index.theme
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    ./autogen.sh --prefix=/usr
    make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}
