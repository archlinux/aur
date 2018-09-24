_pkgname=lsp4xml
pkgname=${_pkgname}-git
pkgver=2018.09.24
pkgrel=1
pkgdesc="XML Language Server"
arch=(any)
url="https://github.com/angelozerr/lsp4xml"
license=('EPL')
depends=('java-runtime')
makedepends=('git' 'java-environment' 'maven')
source=("git+https://github.com/angelozerr/lsp4xml" "${_pkgname}.sh")
sha256sums=('SKIP'
            'c9a7edf89be829c19cde62b9990c38d0db8737a641f3d200e56ecd35d5fdb54e')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    date -I | sed "s/-/./g"
}

build() {
    cd "${srcdir}/${_pkgname}"
    mvn -Dmaven.repo.local="${srcdir}/repo" clean package
}

package() {
    install -Dm755 "${srcdir}/${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "${srcdir}/${_pkgname}/org.eclipse.lsp4xml/target/org.eclipse.lsp4xml-all.jar" \
        "${pkgdir}/usr/share/java/${_pkgname}/org.eclipse.lsp4xml-all.jar"
}
