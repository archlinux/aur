pkgbase=vimix-kde-git
pkgname=(vimix-kde-git)
_pkgname=vimix-kde
pkgver=r35.8ecc8db
pkgrel=1
pkgdesc="Flat Design theme for KDE Plasma desktop"
arch=(any)
url="https://github.com/vinceliuice/$_pkgname"
license=('GPL3')
options=('!strip')
source=("git+$url.git")
sha256sums=('SKIP')
makedepends=('git')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package_vimix-kde-git() {
    provides=('vimix-kde')
    conflicts=('kvantum-theme-vimix-git')
    optdepends=('vimix-cursors: Matching cursor theme'
                'vimix-gtk-themes: Matching GTK theme'
                'vimix-icon-theme: Matching icon theme')

    cd $_pkgname

    install -d "${pkgdir}/usr/share"

    mkdir -p "${pkgdir}/usr/share/aurorae/themes"
    mkdir -p "${pkgdir}/usr/share/plasma/desktoptheme"
    mkdir -p "${pkgdir}/usr/share/sddm"

    cp -r plasma/desktoptheme/{Vimix,Vimix-Amethyst,Vimix-Beryl-Blur,Vimix-Beryl,Vimix-Blur,Vimix-Doder-Blur,Vimix-Doder,Vimix-Ruby,Vimix-Ruby-Blur} "${pkgdir}/usr/share/plasma/desktoptheme"
    cp -r aurorae/* "${pkgdir}/usr/share/aurorae/themes"
    cp -r color-schemes "${pkgdir}/usr/share"
    cp -r plasma/look-and-feel "${pkgdir}/usr/share/plasma"
    cp -r sddm/themes "${pkgdir}/usr/share/sddm"
    cp -r Kvantum "${pkgdir}/usr/share"
}
