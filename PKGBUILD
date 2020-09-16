# Maintainer: Cullen Ross <cullenrss@gmail.com>

_pkgname='desknamer'
pkgname="${_pkgname}-git"
pkgver=r48.c130da0
pkgrel=3
pkgdesc='automatically rename bspwm desktops based on applications inside'
arch=('any')
url="https://gitlab.com/jallbrit/${_pkgname}"
license=('GPL3')
depends=('bspwm' 'python' 'bash')
makedepends=('git')
provides=('desknamer')
source=("${_pkgname}::git+${url}.git")
md5sums=(SKIP)

pkgver() {
    cd "${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/${_pkgname}"
    install -Dm 755 "${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"
    mkdir -p ~/.config/desknamer 
    cp -n desknamer.json ~/.config/desknamer/ 
    touch ~/.config/desknamer/monitor.blacklist ~/.config/desknamer/desktop.blacklist
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/${_pkgname}"
}
