# Maintainer: Johannes Wienke <languitar@semipol.de>

pkgname=xml-language-server-git
_xpkgname=xml-language-server
pkgver=r10.7a2bcbc
pkgrel=1
pkgdesc="Language server for XML files"
url="https://github.com/microclimate-devops/xml-language-server"
license=('EPL')
arch=('any')
depends=('java-environment' 'archlinux-java-run')
makedepends=('java-environment' 'maven')
conflicts=('xml-language-server')
provides=('xml-language-server')
source=("git+https://github.com/microclimate-devops/xml-language-server.git"
        "launcher.sh")
md5sums=('SKIP'
         '9d1121d6db14da3d7cfb74feb552e5e8')

pkgver() {
    cd "${srcdir}/${_xpkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${_xpkgname}/server/xml-server"
    mvn package
}

package() {
    install -Dm644 "${srcdir}/${_xpkgname}/server/xml-server/target/"*-server-all.jar \
                   "${pkgdir}/usr/share/java/${_xpkgname}/xml-language-server-all.jar"
    install -Dm755 "${srcdir}/launcher.sh" \
                   "${pkgdir}/usr/bin/${_xpkgname}"
}
