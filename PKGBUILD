# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: Philip Müller <philm[at]manjaro[dog]org>
# Contributor: artoo <artoo@manjaro.org>
# Contributor: anex <assassin.anex[@]gmail.com>
# Contributor: Stefano Capitani <stefano@manjaro.org>
# Contributor: Matti Hyttinen <matti@manjaro.org> 


pkgbase=singularity-grub-theme
pkgname=('grub-theme-live-common' 'grub-theme-live-singularity' 'grub-theme-singularity')
pkgver=20.2
pkgrel=12
_commit=b08db8b7bb6edfb6cc2c2b577393d0f84773cd14

pkgdesc='Singularity Linux grub theme'
arch=('any')
url="https://gitlab.com/waser-technologies/images/wallpapers/singulartiy-grub-theme"
license=('MIT')
makedepends=('git')
source=("grub-theme::git+$url.git#commit=$_commit")
sha256sums=('SKIP')

package_grub-theme-live-common() {
    depends=('grub')
    conflicts=('grub-theme-live')
    replaces=('grub-theme-live')

    cd grub-theme
    make PREFIX=/usr DESTDIR=${pkgdir} install_common
}
package_grub-theme-live-singularity() {
    depends=('grub-theme-live-common')

    cd grub-theme
    make PREFIX=/usr DESTDIR=${pkgdir} install_singularity
}

package_grub-theme-singularity() {
	depends=('grub')
	install=singularity-theme.install
    
    cd grub-theme/singularity-live
    sed -i -e 's,.*text = "Welcome Commander".*,#text = "Welcome Commander",' theme.txt #remove welcome message
    find . -type f -exec install -D -m644 {} ${pkgdir}/usr/share/grub/themes/singularity/{} \;
}
