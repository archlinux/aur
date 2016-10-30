# Maintainer: NicoHood <archlinux {cat} nicohood {dog} de>
# PGP ID: 97312D5EB9D7AE7D0BD4307351DAE9B7C1AE9161
# Contributor: ELmoussaoui Bilal <bil.elmoussaoui@gmail.com>

pkgname=arc-icon-theme
pkgver=20160605
pkgrel=2
pkgdesc='Arc icon theme. Official releases only.'
arch=('any')
url="https://github.com/horst3180/arc-icon-theme"
license=('GPL3')
depends=('gtk-update-icon-cache' 'hicolor-icon-theme')
optdepends=( #'moka-icon-theme-git: Arc icon theme was built to be used on top of Moka icon theme'
             #'faba-icon-theme: Smaller version of moka with no application icons'
            'elementary: Secondary icon theme fallback')
options=('!emptydirs' '!strip')
source=("https://github.com/horst3180/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('cb5ae5b828c2945614885672d2bd741dffe7cd77c0b7bf2d060bdcac046b7cee7dc5c6643e51bd2954b54d40aa05afddc555e2a1523ba8443cedf7997ad218d1')
conflicts=('arc-icon-theme-git')

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
