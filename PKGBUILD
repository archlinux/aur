# Maintainer: sQVe <oskargrunning@gmail.com>

arch=('any')
depends=('gtk3' 'gtk-engine-murrine' 'gtk-engines')
license=('GPL3')
md5sums=('SKIP' 'SKIP')
pkgdesc='Vimix is a flat Material Design theme for GTK 3, GTK 2 and Gnome-Shell'
pkgname=vimix-gtk-themes-git
pkgrel=1
pkgver=r300.c26a40e
source=('Install.patch'
        'git+https://github.com/vinceliuice/vimix-gtk-themes.git')
makedepends=('git' 'patch')
url='https://github.com/vinceliuice/vimix-gtk-themes'

_gitname=vimix-gtk-themes

pkgver() {
    cd "${_gitname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${_gitname}"
    patch Install < "${srcdir}/Install.patch"
}

package() {
    cd "${_gitname}"
    install -m755 -d "${pkgdir}/usr/share/themes"
    DEST_DIR="${pkgdir}/usr/share/themes" ./Install
}
