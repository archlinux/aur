# Maintainer: Dominic Zimmer <s8dozimm@stud.uni-saarland.de> 
_pkgname=pseucoco
pkgname="${_pkgname}"
pkgver=2.3
pkgrel=3
pkgdesc="A Pseuco compiler written in Java"
arch=("i686" "x86_64")
url="https://liebe.cs.uni-saarland.de/gitlab/pseuco/pseuco-java-compiler"
license=('GPL')
depends=("java-runtime" "sudo")
makedepends=("gradle")

provides=("pseucoco")
conflicts=("pseucoco")
install="${_pkgname}.install"
source=("pseucoco::git+${url}.git")
md5sums=("SKIP")

build() {
    cd pseucoco
    gradle jar
}

package() {
    mkdir -p $pkgdir/usr/share/${_pkgname}/include
    mkdir -p $pkgdir/usr/bin
    cat ../executable > $pkgdir/usr/bin/pseucoco
    chmod +x $pkgdir/usr/bin/pseucoco
    cd pseucoco
    cp -r include build/libs/pseucoco-2.3.jar $pkgdir/usr/share/${_pkgname}
    echo "package"
}
