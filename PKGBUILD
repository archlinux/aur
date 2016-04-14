# Maintainer=rafaelsoaresbr <rafaelsoaresbr@gmail.com>
# umlet
# Contributing: https://github.com/rafaelsoaresbr/umlet.git
# Builds: https://gitlab.com/rafaelsoaresbr/umlet/builds
pkgbase="umlet"
pkgname=($pkgbase{-standalone,-eclipse-plugin})

# Version
pkgver=14.2
pkgrel=1
#epoch=
_date="2016-04-03"
_tag="${_date}_UMLet_v${pkgver}"

# Generic
pkgdesc="Free UML Tool for Fast UML Diagrams"
arch=('any')
url="http://www.umlet.com/"
license=('GPL3')
#groups=()

# Dependencies
depends=('java-environment')
#optdepends=()
makedepends=('maven' 'unzip')
#checkdepends=()

# Package Relations
#provides=()
#conflicts=()
#replaces=()

# Others
#backup=()
#options=()
#install=actor
#changelog=changelog

# Sources
source=("umlet.sh" "umlet.desktop" "https://github.com/umlet/umlet/archive/${_tag}.tar.gz")
#source_i686=("")
#source_x86_64=("")
#noextract=()
#validpgpkeys=()

# Integrity
md5sums=('SKIP' 'SKIP' '46221fd47003f88ffe881954d68dfc83')
#md5sums_i686=('')
#md5sums_x86_64=('')
#sha1sums=()
#sha256sums=()

#pkgver() {
#}

#prepare() {
#}

build() {
    cd umlet-${_date}_UMLet_v${pkgver}
    mvn clean install
}

#check() {
#}

package_umlet-standalone() {
    pkgdesc="${pkgdesc} (Standalone Version)"
    install -dm755 "$pkgdir/usr/share/applications/"
    install -dm755 "$pkgdir/usr/bin/"
    install -dm755 "$pkgdir/opt/"
    unzip "$srcdir/umlet-${_date}_UMLet_v${pkgver}/umlet-standalone/target/umlet-standalone-${pkgver}.zip" -d "$pkgdir/opt"
    rm "$pkgdir/opt/Umlet/umlet.desktop"
    rm "$pkgdir/opt/Umlet/umlet.sh"
    install -Dm644 "$srcdir/umlet.desktop" "$pkgdir/usr/share/applications/"
    install -Dm755 "$srcdir/umlet.sh" "$pkgdir/usr/bin/"
}

package_umlet-eclipse-plugin() {
    pkgdesc="${pkgdesc} (Eclipse Plugin Version)"
    depends=('eclipse')
    replaces=('eclipse-umlet')
    install -dm755 "$pkgdir/usr/share/eclipse/plugins"
    install -Dm644 "$srcdir/umlet-${_date}_UMLet_v${pkgver}/umlet-eclipse-plugin/target/com.umlet.plugin-${pkgver}.jar" "$pkgdir/usr/share/eclipse/plugins"
}
