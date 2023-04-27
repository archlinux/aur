# Maintainer: morpheusthewhite <zffromGerace@hotmail.it>

pkgname=spicetify-themes-git
pkgver=r404.4f10f4f
pkgrel=1
pkgdesc="A community-driven collection of themes for spicetify"
arch=('any')
url="https://github.com/spicetify/spicetify-themes"
license=('MIT')
groups=()
depends=('spicetify-cli')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=spicetify-themes-git.install
source=("$pkgname"::"git+https://github.com/spicetify/spicetify-themes")
noextract=()
md5sums=('SKIP')

pkgver() {
    cd "$pkgname"
    ( set -o pipefail
      git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

package() {
    mkdir -p "${pkgdir}"/usr/share/spicetify-cli/Extensions

    cp -R "$srcdir/${pkgname}" "${pkgdir}"/usr/share/spicetify-cli/Themes
    rm -r "${pkgdir}"/usr/share/spicetify-cli/Themes/README.md "${pkgdir}"/usr/share/spicetify-cli/Themes/LICENSE
}
