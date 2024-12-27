pkgname="spicetify-theme-nord-git"
pkgver=r535.gcca99f3
pkgrel=1
pkgdesc="Nord Themed Spotify (JoshuaWierenga's fork)"
arch=("any")
url="https://tetrax-10.github.io/Nord-Spotify/"
license=("MIT")
depends=("spicetify-cli")
makedepends=("git" "npm")
provides=("spicetify-theme-nord")
conflicts=("spicetify-theme-nord")
source=(
    "git+https://github.com/JoshuaWierenga/Nord-Spotify#branch=fixes"
    "0001-Remove-broken-sp-desktop-v1-version.patch"
)
sha256sums=('SKIP'
            '99aa2aabb1dd61293f1e24f3a7c2ed4061c5fef1c1ffb98d5835ed7c8854c851')

prepare() {
    cd "${srcdir}/Nord-Spotify"
    git apply ../0001-Remove-broken-sp-desktop-v1-version.patch
}
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
