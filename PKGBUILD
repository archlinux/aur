# Maintainer: Robosky <fangyuhao0612@gmail.com>

pkgbase=vimix-kde-git
_gitname=vimix-kde
pkgname=('vimix-kde-git' 'kvantum-theme-vimix-git')
pkgver=23.0b832b4
pkgrel=1
pkgdesc="Vimix kde is a flat Design theme for KDE Plasma desktop"
arch=('any')
url="https://github.com/vinceliuice/${_gitname}"
license=('GPL3')
options=('!strip')
source=("git+${url}.git")
md5sums=('SKIP')
makedepends=('git')

pkgver() {
    cd "${srcdir}/${_gitname}"
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package_vimix-kde-git() {
    optdepends=('vimix-gtk-themes-git: Matching GTK theme'
        'kvantum-theme-vimix-git: Vimix theme for Kvantum'
        'tela-icon-theme-git: Recommended icon theme')
	
    cd "${srcdir}/${_gitname}"
    install -d "${pkgdir}/"usr/share/{aurorae,color-schemes,plasma}
	
	sed -i '5,8d' install.sh
	
    AURORAE_DIR=${pkgdir}/usr/share/aurorae/themes \
    SCHEMES_DIR=${pkgdir}/usr/share/color-schemes \
    PLASMA_DIR=${pkgdir}/usr/share/plasma/desktoptheme \
    LOOKFEEL_DIR=${pkgdir}/usr/share/plasma/look-and-feel \
    ./install.sh -b
}

package_kvantum-theme-vimix-git() {
    pkgdesc="Vimix theme for Kvantum"
    depends=('kvantum-qt5')
    optdepends=('vimix-gtk-themes-git: Matching GTK theme'
        'vimix-kde-git: Matching KDE Plasma 5 theme'
        'tela-icon-theme-git: Recommended icon theme')
	
    cd "${srcdir}/${_gitname}"
    install -d "${pkgdir}/"usr/share
	
    cp -r Kvantum "${pkgdir}/"usr/share
}
	
