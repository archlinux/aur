# Maintainer: desbma
# shellcheck disable=SC2034,SC2148,SC2154,SC2164
pkgname=sync-pacman-hook-git
pkgver=r81.9d5f298
pkgrel=1
pkgdesc='Pacman hook to sync filesystem'
arch=('any')
_gitname='pacman-hooks'
url="https://github.com/desbma/${_gitname}"
license=('GPL')
makedepends=('git')
conflicts=('pacman-hooks-desbma-git')
source=("git+https://github.com/desbma/${_gitname}")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_gitname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/${_gitname}"
    install -Dm 644 sync/boot_sync.hook "${pkgdir}/usr/share/libalpm/hooks/zz99-boot_sync.hook"
    install -Dm 644 sync/root_sync.hook "${pkgdir}/usr/share/libalpm/hooks/zz99-root_sync.hook"
}
