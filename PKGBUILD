# Maintainer: GiacoLenzo2109 <GiacoLenzo2109@gmail.com>
# Contributor: Philip Müller <philm[at]garuda[dog]org>
# Contributor: artoo <artoo@garuda.org>
# Contributor: anex <assassin.anex[@]gmail.com>
# Contributor: Stefano Capitani <stefano@manjaro.org>
# Contributor: Matti Hyttinen <matti@garuda.org> 

pkgbase=grub-theme-croco-custom
pkgname=('grub-theme-croco-custom')
pkgver=r1
pkgrel=1

pkgdesc='Croco OS grub theme'
arch=('any')
url="https://gitlab.com/croco-os/themes-and-settings/grub-theme-croco-custom"
license=('GPL')
makedepends=('git')
source=("grub-theme::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd ${srcdir}/grub-theme
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	depends=('grub' 'grub-theme-croco-live' 'grub-theme-croco-live-common')
	install=croco-theme.install
    conflicts=('grub-theme-croco')
    cd grub-theme/croco-live
    sed -i -e 's,.*text = "Welcome to Croco".*,#text = "Welcome to Croco",' theme.txt #remove welcome message
    find . -type f -exec install -D -m644 {} ${pkgdir}/usr/share/grub/themes/croco/{} \;
}



