# Maintainer: Adam Schadler <ajschadler@gmail.com>
_pkgname=vim-lumen
pkgname=${_pkgname}-git
pkgver=v1.0.r18.a04ef1d
pkgrel=1
pkgdesc="PLugin automatically switches vim background to match system light/dark mode"
arch=('any')
url="https://github.com/vimpostor/vim-lumen"
license=('GPL3')
groups=('vim-plugins')
depends=('vim-runtime' 'glib2')
makedepends=('git')
optdepends=(
    "plasma-desktop: supported color switcher"
    "gnome-desktop: supported color switcher"
    "darkman: supported color switcher"
    "color-scheme-simulator: supported color switcher"
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+${url}")
md5sums=('SKIP')
install=${_pkgname}.install

pkgver() {
	cd "$srcdir/${_pkgname}"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

package() {
    local __installpath="${pkgdir}/usr/share/vim/vimfiles"
    local __docpath="${pkgdir}/usr/share/doc/${_pkgname}"
    local __dirs=(autoload/ doc/ lua/ plugin/)
    cd "$srcdir/${_pkgname}"

    install -d ${__installpath} ${__docpath}
    cp -r -t ${__installpath} ${__dirs[@]}
    install -Dm644 README.md -t "$__docpath"
}


