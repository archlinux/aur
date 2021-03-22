# Maintainer: Kyle Czar <czar at kalli dot st>
_name=neptune
pkgname=${_name}-git
provides=($_name)
pkgver=r149.357e25d
pkgrel=1
pkgdesc="YouTube based song player, made with GTK and GoLang."
arch=('i686' 'x86_64')
url="https://github.com/pauloo27/$_name"
license=('GPL2')
depends=(
    'mpv'
    'youtube-dl'
    'libappindicator-gtk3'
)
optdepends=(
    'mpv-mpris: Load MPRIS'
)
makedepends=(
    'git'
    'go'
)

source=("${pkgname}::git+https://github.com/pauloo27/${_name}.git")
md5sums=('SKIP')

pkgver() {
   cd "$pkgname"
   printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${pkgname}"
    make
}

package() {
    cd "${srcdir}/${pkgname}"
    install -DT ${_name} ${pkgdir}/usr/bin/${_name}
    install -DT LICENSE "${pkgdir}/usr/share/licenses/${_name}/LICENSE"
}
