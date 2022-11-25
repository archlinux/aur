# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: Philip Müller <philm[at]singularity[dog]org>
# Contributor: artoo <artoo@singularity.org>
# Contributor: anex <assassin.anex[@]gmail.com>
# Contributor: Stefano Capitani <stefano@singularity.org>
# Contributor: Matti Hyttinen <matti@singularity.org> 


pkgbase=grub-theme-live
pkgname=('grub-theme-live-common' 'grub-theme-live-singularity' 'grub-theme-singularity')
pkgver=20.2
pkgrel=11
_commit=90ae1f550465a38289da575853756da2c61ddeb4

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
