# Maintainer: Ricardo Grim Cabrita <grimkriegor@krutt.org>

pkgname=kotlin-language-server
pkgver=0.1.13
_commit=e3df0185ebcdf9502051fd806e45a9469e9d41e4
pkgrel=1
pkgdesc="Smart code completion, diagnostics and more for Kotlin using the Language Server Protocol"
arch=(any)
url="https://github.com/fwcd/KotlinLanguageServer.git"
license=('MIT')
depends=('java-runtime')
makedepends=('git' 'gradle')
source=("${pkgname}::git+https://github.com/fwcd/KotlinLanguageServer.git#commit=$_commit")
sha256sums=('SKIP')

build() {
    cd "${srcdir}/${pkgname}"
    gradle server:installDist
}

package() {
    mkdir -p \
      "${pkgdir}/usr/share/kotlin" \
      "${pkgdir}/usr/bin"
    cp -r \
      "${srcdir}/${pkgname}/server/build/install/server/" \
      "${pkgdir}/usr/share/kotlin/kotlin-language-server"
    ln -srf \
      "${pkgdir}/usr/share/kotlin/kotlin-language-server/bin/server" \
      "${pkgdir}/usr/bin/kotlin-language-server"
}

