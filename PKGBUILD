pkgname="spicetify-theme-nord-git"
pkgver=r527.g212f1d1
pkgrel=2
pkgdesc="Nord Themed Spotify (JoshuaWierenga's fork)"
arch=("any")
url="https://tetrax-10.github.io/Nord-Spotify/"
license=("MIT")
depends=("spicetify-cli")
makedepends=("git" "npm")
provides=("spicetify-theme-nord")
conflicts=("spicetify-theme-nord")
source=(
    "git+https://github.com/JoshuaWierenga/Nord-Spotify"
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
    mkdir -p "${pkgdir}/opt/spicetify-cli/Themes"
    cp -a --no-preserve=ownership dist/Nord "${pkgdir}/opt/spicetify-cli/Themes"
}
