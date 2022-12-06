# Maintainer: Zhang Hua <zhanghua.00 at qq dot com>

pkgname=spicetify-extensions-charlies-git
pkgver=r127.ccee5da
pkgrel=1
pkgdesc="CharlieS1103's extensions for spicetify."
arch=("any")
url="https://github.com/CharlieS1103/spicetify-extensions"
license=("MIT")
depends=("spicetify-cli")
makedepends=("git")
provides=("spicetify-extensions-charlies")
conflicts=("spicetify-extensions-charlies")
source=(
    "git+${url}.git"
    "spicetify-extensions-charlies.hook"
)
sha256sums=('SKIP'
            'c7491352e601168821a0b3fbd0f80b3be20c61f7d38a8bbc6e1972a6eb9597e7')

pkgver(){
    cd "${srcdir}/spicetify-extensions"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
package(){
    cd "${srcdir}/spicetify-extensions"
    mkdir -p "${pkgdir}/usr/share/spicetify-cli/Extensions"
    install -Dm644 "${srcdir}/spicetify-extensions-charlies.hook" \
        "${pkgdir}/usr/share/libalpm/hooks/spicetify-extensions-charlies.hook"
    plugins=(adblock featureshuffle fixEnhance formatColors phraseToPlaylist songstats wikify)
    for dir in ${plugins[@]}
    do
        install -Dm644 ${dir}/${dir}.js "${pkgdir}/usr/share/spicetify-cli/Extensions/${dir}.js"
    done

}
