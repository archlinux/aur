# Maintainer: Tom Bu <tombu@tombu.info>

pkgname=ciel-arch-plugins-git
_pkgname=ciel-arch-plugins
pkgver=r6.58a1f23
pkgrel=1
pkgdesc="Arch Linux integration plugins for the Ciel container manager."
arch=('x86_64')
url="https://gitlab.com/arch-linux-mipsr6/${_pkgname}"
license=('NCSA')
depends=('bash' 'ciel' 'util-linux')
provides=("${_pkgname}")
makedepends=('git')
source=("$pkgname::git+${url}.git")
md5sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$pkgname"
    # Install the plugins
    for i in makepkg provision sync-image
    do
      install -Dm755 ciel-arch-${i} ${pkgdir}/usr/libexec/ciel-plugins/ciel-arch-${i}
    done

    # Install the license
    install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/"${_pkgname}"/LICENSE
}
