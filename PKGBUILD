pkgname="spicetify-theme-nord-git"
pkgver=r518.g2dbfc7d
pkgrel=2
pkgdesc="Nord Themed Spotify"
arch=("any")
url="https://tetrax-10.github.io/Nord-Spotify/"
license=("MIT")
depends=("spicetify-cli")
makedepends=("git" "npm")
provides=("spicetify-theme-nord")
conflicts=("spicetify-theme-nord")
source=(
    "git+https://github.com/Tetrax-10/Nord-Spotify"
)
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/Nord-Spotify"
    echo "r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}
build() {
    cd "${srcdir}/Nord-Spotify"
    npm ci
    npm run build-local
}
package() {
    cd "${srcdir}/Nord-Spotify"
    mkdir -p "${pkgdir}/usr/share/spicetify-cli/Themes"
    cp -av dist/Nord "${pkgdir}/usr/share/spicetify-cli/Themes"
}
