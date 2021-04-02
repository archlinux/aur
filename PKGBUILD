# Maintainer: MoltenCoreDev <craxell.tv@gmail.com>

_pkgname="pyfetch"
pkgname="${_pkgname}-git"
pkgver=1.0.0
pkgrel=1
pkgdesc="A simple and fast alternative to neofetch."
arch=('x86_64')
url="https://kreatea.ml/kreato/pyfetch"
license=('GPL v3')
groups=()
depends=('wmctrl' 'otf-font-awesome' 'python' 'python-pip')
makedepends=()
provides=("${_pkgname}")
conflicts=("${_pkgname}")
backup=("usr/share/${_pkgname}/data")
source=("${_pkgname}-source::git+${url}#commit=420615217bdc11849adce66a5931e6233e5f2fd1")
md5sums=('SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
    cd "${_pkgname}-source"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    chmod +x pyfetch
    # install deps
    pip install distro psutil colorama
}


package() {
    cd "${_pkgname}-source"

    # install script
    install -Dm 755 "pyfetch" "${pkgdir}/usr/bin/${_pkgname}"
}
