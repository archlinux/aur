pkgname=grub-theme-boot-minegrub-git
pkgver=r101.f6e1c9a
pkgrel=1
pkgdesc="A Grub Theme in the style of Minecraft!"
arch=('any')
url="https://github.com/Lxtharia/minegrub-theme"
depends=('grub')
makedepends=('git')
provides=(grub-theme-minegrub)
conflicts=(grub-theme-minegrub)
source=("${pkgname}::git+${url}.git")
md5sums=('SKIP')
_themedir="/boot/grub/themes/minegrub"

pkgver() {
    cd "${srcdir}/${pkgname}"
    
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}"

    install -dm755 ${pkgdir}${_themedir}
    cp -rf --no-preserve=ownership "${pkgname}"/minegrub/* ${pkgdir}${_themedir}
     
    install -Dpm644 "${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dpm644 "${pkgname}/minegrub-update.service" -t "${pkgdir}/usr/lib/systemd/system"
}
