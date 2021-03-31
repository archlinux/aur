# Maintainer: Kyle Czar <czar at kalli dot st>
pkgname=go-tuner-git
provides=('go-tuner')
pkgver=r253.b3c7a72
pkgrel=1
pkgdesc="Search and Play songs from YouTube inside your terminal."
arch=('i686' 'x86_64')
url="https://github.com/pauloo27/tuner"
license=('GPL2')
groups=()
depends=(
    'mpv'
    'youtube-dl'
)
optdepends=(
    'mpv-mpris: Load MPRIS'
    'ueberzug: Show album art'
)
makedepends=(
    'git'
    'go'
)

options=()
source=("${pkgname}::git+https://github.com/pauloo27/tuner")
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
    install -DT tuner ${pkgdir}/usr/bin/tuner
    install -DT LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
