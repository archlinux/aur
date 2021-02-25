# Maintainer: GiacoLenzo2109 <GiacoLenzo2109@gmail.com>
# Contributor: Philip Müller <philm[at]garuda[dog]org>
# Contributor: artoo <artoo@garuda.org>
# Contributor: anex <assassin.anex[@]gmail.com>
# Contributor: Stefano Capitani <stefano@garuda.org>
# Contributor: Matti Hyttinen <matti@garuda.org> 


pkgbase=grub-theme-croco
pkgname=('grub-theme-croco-live-common' 'grub-theme-croco-live' 'grub-theme-croco')
pkgver=r14.1cd9ac3
pkgrel=1

pkgdesc='croco Linux grub theme'
arch=('any')
url="https://gitlab.com/croco-os/themes-and-settings/grub-theme-croco"
license=('GPL')
makedepends=('git')
source=("grub-theme::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd ${srcdir}/grub-theme
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package_grub-theme-croco-live-common() {
    depends=('grub')

    cd grub-theme
    make PREFIX=/usr DESTDIR=${pkgdir} install_common
}
package_grub-theme-croco-live() {
    depends=('grub-theme-croco-live-common')

    cd grub-theme
    make PREFIX=/usr DESTDIR=${pkgdir} install_croco
}

package_grub-theme-croco() {
	depends=('grub')
	install=croco-theme.install
    
    cd grub-theme/croco-live
    sed -i -e 's,.*text = "Welcome to Croco".*,#text = "Welcome to Croco",' theme.txt #remove welcome message
    find . -type f -exec install -D -m644 {} ${pkgdir}/usr/share/grub/themes/croco/{} \;
}



