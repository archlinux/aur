# Maintainer: Kamack38 <kamack38.biznes@gmail.com>
_pkgname='metro-for-steam-skin'
pkgname="up-${_pkgname}"
pkgver=r367.13b1cf4
pkgrel=1
pkgdesc="This non-official addon for Metro for Steam fixes bugs with the current version and adds optional content for you to choose from."
arch=('i686' 'x86_64')
url="https://github.com/redsigma/UPMetroSkin"
license=('UNLICENSE')
depends=('steam' 'sssm')
makedepends=('git' 'rsync')
optdepends=()
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=('git+https://github.com/minischetti/metro-for-steam.git' 'git+https://github.com/redsigma/UPMetroSkin')
sha1sums=('SKIP'
          'SKIP')
install="$pkgname.install"

pkgver() {
    cd "${srcdir}/UPMetroSkin"
    printf "%sr%s.%s" "$(cat version | tr -d " \t\n\r")" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    mkdir -p ${pkgdir}/usr/share/steam/skins
    install -Dm644 ${srcdir}/metro-for-steam/LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    mv ${srcdir}/metro-for-steam ${pkgdir}/usr/share/steam/skins
    mv "${srcdir}/UPMetroSkin/Unofficial 4.x Patch/Extras/" ${pkgdir}/usr/share/steam/skins/metro-for-steam
    rsync -a "${srcdir}/UPMetroSkin/Unofficial 4.x Patch/Main Files [Install First]/" ${pkgdir}/usr/share/steam/skins/metro-for-steam
}
