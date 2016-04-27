# Maintainer: Matthew Gamble <git@matthewgamble.net>

pkgname=siren-image-builder-git
pkgver=2016.03.19
pkgrel=1
pkgdesc="Image builder for systemd-machined"
arch=("any")
url="https://github.com/LEW21/siren"
license=("MIT")
conflicts=("siren-image-builder")
provides=("siren-image-builder")
depends=("linux>=4.0" "systemd>=220")
makedepends=("go" "git")
_gourl_base="github.com/LEW21/siren"
_gourl_image="${_gourl_base}"
_gourl_imagectl="${_gourl_base}/imagectl/cmd/imagectl"

build() {
    GOPATH="${srcdir}" go get -fix -v -x ${_gourl_image}
    GOPATH="${srcdir}" go get -fix -v -x ${_gourl_imagectl}
}

package() {
    install -Dm755 "${srcdir}/bin/siren" "${pkgdir}/usr/bin/siren-image"
    install -Dm755 "${srcdir}/bin/imagectl" "${pkgdir}/usr/bin/siren-imagectl"

    install -Dm755 "${srcdir}/src/${_gourl_base}/LICENSE.txt" "${pkgdir}/usr/share/licenses/siren-image-builder/LICENSE.txt"
    install -Dm755 "${srcdir}/src/${_gourl_base}/README.md" "${pkgdir}/usr/share/doc/siren-image-builder/README-siren.md"
    install -Dm755 "${srcdir}/src/${_gourl_base}/imagectl/README.md" "${pkgdir}/usr/share/doc/siren-image-builder/README-imagectl.md"
}
