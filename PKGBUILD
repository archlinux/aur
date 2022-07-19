# Maintainer: AvinashReddy3108 <cassilasreddythemostwanted3108@gmail.com>
# PKGBUILD based on the 'spicetify-themes-git' package maintained by morpheusthewhite <zffromGerace@hotmail.it>

pkgname=spicetify-custom-apps-and-extensions-git
pkgver=r115.0f5e79f
pkgrel=1
pkgdesc="A community-driven collection of custom apps and extensions for spicetify"
arch=('any')
url="https://github.com/3raxton/spicetify-custom-apps-and-extensions"
license=('MIT')
depends=('spicetify-cli')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname"::"git+https://github.com/3raxton/spicetify-custom-apps-and-extensions")
md5sums=('SKIP')

pkgver() {
    cd "$pkgname"
    ( set -o pipefail
      git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

# Contrary to the name of the repo (and hence this package),
# It's just a collection of extensions, for now.
package() {
    cd "$pkgname"
    install -Dm 644 ./v2/*/*.js -t "${pkgdir}/usr/share/spicetify-cli/Extensions"
}
