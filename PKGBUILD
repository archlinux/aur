# Maintainer: Ricardo Grim Cabrita <grimkriegor@krutt.org>

pkgname=kotlin-language-server-git
_pkgname=kotlin-language-server
pkgver=r576.e6f7637
pkgrel=1
pkgdesc="Smart code completion, diagnostics and more for Kotlin using the Language Server Protocol"
arch=(any)
url="https://github.com/fwcd/KotlinLanguageServer.git"
license=('MIT')
conflicts=('kotlin-language-server')
provides=('kotlin-language-server')
depends=('java-runtime>=8')
makedepends=('git' 'java-environment>=8')
source=("${_pkgname}::git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${_pkgname}"
    ./gradlew server:installDist
}

package() {
    mkdir -p \
      "${pkgdir}/usr/share/kotlin" \
      "${pkgdir}/usr/bin"
    cp -r \
      "${srcdir}/${_pkgname}/server/build/install/server/" \
      "${pkgdir}/usr/share/kotlin/kotlin-language-server"
    ln -srf \
      "${pkgdir}/usr/share/kotlin/kotlin-language-server/bin/kotlin-language-server" \
      "${pkgdir}/usr/bin/kotlin-language-server"
}

