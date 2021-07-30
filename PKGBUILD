# Maintainer: Christian Brassat <christian.brassat@gmail.com>

_pkgbase=neoray
pkgname=${_pkgbase}-git
pkgver=r295.04af3e7
pkgrel=1
pkgdesc="Go GUI for neovim"
arch=('any')
url="https://github.com/hismailbulut/neoray"
license=('MIT')
depends=('neovim')
makedepends=('go')
conflicts=()
source=('git+https://github.com/hismailbulut/neoray.git'
        'neoray.desktop')
md5sums=('SKIP'
         'f10c9d8fdbf4e7b468770d23b3fb53a3')

pkgver() {
    cd $_pkgbase
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd $_pkgbase
    make release
}

package() {
    install -Dm 644 ${_pkgbase}/LICENSE ${pkgdir}/usr/share/licenses/${_pkgbase}/LICENSE
    install -Dm 644 ${_pkgbase}.desktop ${pkgdir}/usr/share/applications/${_pkgbase}.desktop
    install -Dm 755 ${_pkgbase}/bin/neoray ${pkgdir}/usr/bin/${_pkgbase}
}
