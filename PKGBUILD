# Maintainer: Matt Melling <mattmelling@fastmail.com>

pkgname=cypher-shell-git
pkgdesc="A command line shell where you can execute Cypher against an instance of Neo4j (install from git)"
pkgver=3.4.5.r7.g31a7bef
pkgrel=1
arch=("any")
url="https://github.com/neo4j/cypher-shell"
license=("GPL")
makedepends=("jdk8-openjdk" "maven")
depends=("java-environment=8" "bash")
options=(!strip)
source=("$pkgname::git+https://github.com/neo4j/cypher-shell.git")
sha256sums=("SKIP")
conflicts=("cypher-shell")

pkgver() {
    cd "${srcdir}/${pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | cut -c 7-
}

build() {
    cd "${srcdir}/${pkgname}"
    make build
}

package() {
    installdir="${srcdir}/${pkgname}/cypher-shell/build/install/cypher-shell/"
    install -D -m644 "${installdir}/cypher-shell-all.jar" "${pkgdir}/usr/share/cypher-shell/lib/cypher-shell-all.jar"
    install -D -m755 "${installdir}/cypher-shell" "${pkgdir}/usr/bin/cypher-shell"
}
