# Maintainer: Hari Chalise <harilvfs@chalisehari.com.np>
pkgname=carch-git
_pkgname=carch
pkgver=v4.0.0.r2.g08fbdca
pkgrel=1
pkgdesc="An automated script for quick & easy Arch Linux system setup"
arch=(any)
url="https://github.com/harilvfs/$_pkgname"
license=('GPL')
options=(!strip)
depends=(
    "bash"
    "man-pages"
    "zip"
    "gum"
    "git"
    "sed"
    "xdg-user-dirs"
    "wget"
    "figlet"
    "pacman" 
    "unzip"
    "python"
    "gtk3"
)

source=("${pkgname}::git+https://github.com/harilvfs/$_pkgname.git")
md5sums=('SKIP')

conflicts=($_pkgname)
makedepends=(git)

pkgver() {

    #version
    cd "$pkgname"
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'

}

package() {

    # bin
    install -Dm 755 ${srcdir}/${pkgname}/build/carch -t ${pkgdir}/usr/bin/carch

    install -Dm 755 ${srcdir}/${pkgname}/cli/carchcli -t ${pkgdir}/usr/bin/carchcli

    install -Dm 755 ${srcdir}/${pkgname}/gtk/carch-gtk -t ${pkgdir}/usr/bin/carch-gtk

    install -Dm 755 ${srcdir}/${pkgname}/gtk/carch-gtk.py -t ${pkgdir}/usr/bin/carch-gtk.py

    install -d "$pkgdir/usr/bin/scripts"
    
    install -Dm 755 ${srcdir}/${pkgname}/scripts/*.sh -t ${pkgdir}/usr/bin/scripts/

    # desktop entry
    install -Dm 644 ${srcdir}/${pkgname}/carch.desktop -t ${pkgdir}/usr/share/applications/carch.desktop

    # license
    install -Dm 644 ${srcdir}/${pkgname}/LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

    # doc
    install -Dm 644 ${srcdir}/${pkgname}/README.md -t ${pkgdir}/usr/share/doc/${pkgname}/README.md



}

