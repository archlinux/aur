pkgname="spicetify-theme-nord-git"
pkgver=r522.gc61f684
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
    "dynamicColors-fetchDynamicColor-using-graphql.diff::https://github.com/JoshuaWierenga/Nord-Spotify/pull/1.diff"
)
sha256sums=('SKIP'
            'ee0b2f853a84ad344e49d0e820a268038e67f6fcb2e74d64104e14e7eb5153b8')

pkgver() {
    cd "${srcdir}/Nord-Spotify"
    echo "r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}
build() {
    cd "${srcdir}/Nord-Spotify"
    git apply ../dynamicColors-fetchDynamicColor-using-graphql.diff
    npm ci
    npm run build-local
}
package() {
    cd "${srcdir}/Nord-Spotify"
    mkdir -p "${pkgdir}/usr/share/spicetify-cli/Themes"
    cp -a --no-preserve=ownership dist/Nord "${pkgdir}/usr/share/spicetify-cli/Themes"
}
