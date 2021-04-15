# Maintainer: AvinashReddy3108 <cassilasreddythemostwanted3108@gmail.com>
# PKGBUILD based on the 'spicetify-themes-git' package maintained by morpheusthewhite <zffromGerace@hotmail.it>

pkgname=spicetify-custom-apps-and-extensions-git
pkgver=r77.5471fd5
pkgrel=1
pkgdesc="A community-driven collection of custom apps and extensions for spicetify"
arch=('any')
url="https://github.com/3raxton/spicetify-custom-apps-and-extensions"
license=('MIT')
groups=()
depends=('spicetify-cli')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
source=("$pkgname"::"git+https://github.com/3raxton/spicetify-custom-apps-and-extensions")
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

    cp -R "$srcdir/${pkgname}" "${pkgdir}"/usr/share/spicetify-cli/CustomApps
    rm -r "${pkgdir}"/usr/share/spicetify-cli/CustomApps/{AUTHORS.md,README.md,CONTRIBUTING.md,LICENSE,CODE_OF_CONDUCT.md}
}
