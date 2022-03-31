# Maintainer: Lucas Rooyakkers <lucas rooyakkers @ pm me>
pkgname=mascii-git
pkgver=r4.74d47b3
pkgrel=2
pkgdesc="This is source code for the Musical Ascii (\"Mascii\") polyphonic text-based music notation system."
arch=('any')
url="https://github.com/arikast/mascii-quickstart"
license=('MIT')
depends=('java-runtime')
makedepends=('java-environment' 'maven')
provides=('mascii')
source=('mascii::git+https://github.com/arikast/mascii-source#branch=master')
md5sums=('SKIP') 

pkgver() {
    cd "mascii"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "mascii"
    cd "scripts"
    ./build.sh
}

package() {
    cd "mascii"

    MASCII_JAR="$(find -name 'mascii-*.jar' | head -n 1)"
    install -Dm755 "$MASCII_JAR" "$pkgdir/usr/bin/mascii.jar"

    echo '#!/bin/bash
java -jar /usr/bin/mascii.jar "$@"' > "$pkgdir/usr/bin/mascii"

    chmod 0755 "$pkgdir/usr/bin/mascii"
}
