# Maintainer: desbma
# shellcheck disable=SC2034,SC2148,SC2154,SC2164
pkgname=pacdiff-pacman-hook-git
pkgver=r74.c463d2d
pkgrel=1
pkgdesc='Pacman hook to review .pacnew files automatically'
arch=('any')
_gitname='pacman-hooks'
url="https://github.com/desbma/${_gitname}"
license=('GPL')
depends=('diffutils' 'git-delta' 'pacman-contrib')
conflicts=('pacman-hooks-desbma-git')
source=("git+https://github.com/desbma/${_gitname}")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_gitname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/${_gitname}"
    install -Dm 644 -t "${pkgdir}/usr/share/libalpm/hooks" pacdiff/pacdiff.hook
    install -Dm 755 -t "${pkgdir}/usr/share/libalpm/scripts" pacdiff/pacdiff_delta
}
