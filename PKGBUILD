# Maintainer: rafaelsoaresbr <rafaelsoaresbr@gmail.com>
# Maintainer: llde 
# modelio-bin
# Contributing: https://github.com/rafaelsoaresbr/pkgbuild
# Builds: https://gitlab.com/rafaelsoaresbr/pkgbuild/builds
#pkgbase=
pkgname=modelio-bin

# Version
_pkgvermajor=4
_pkgverminor=1
_pkgverpatch=0
pkgver="${_pkgvermajor}.${_pkgverminor}.${_pkgverpatch}"
pkgrel=0

# Generic
pkgdesc="The opensource modeling environment"
arch=('x86_64')
url="https://www.modelio.org/"
license=('GPL3')
#groups=()

# Dependencies
depends=('glib2' 'java-runtime' 'libx11' 'libxtst' 'webkit2gtk' 'swt')
optdepends=('atk' 'gtk2' 'cairo')
#makedepends=()
#checkdepends=()

# Package Relations
#provides=()
#conflicts=()
#replaces=()

# Others
#backup=()
#options=()
#install=modelio

# Sources
source=("modelio.desktop" "modelio.patch")
source_x86_64=("modelio-${pkgver}-x86_64.deb::https://sourceforge.net/projects/modeliouml/files/${pkgver}/modelio-open-source_${pkgver}_amd64.deb/download")
#noextract=()
#validpgpkeys=()
sha256sums=('91c3b13be981f6391c1234eb12b8302600447915efc572be56f30b40346f6882'
            'bc87a815e0af78ece34ccbc878b88b17b9b00557a98c113cefc9b4111462dbbb')
sha256sums_x86_64=('20c35e1b289dc5b77115951a1b6513c1c1d40ae828a8c4fb422ff521c8505beb')

#pkgver() {
#}

prepare() {
    ar p modelio-${pkgver}-${CARCH}.deb data.tar.xz | tar xJ
    cd "${srcdir}/usr/lib/modelio-open-source${_pkgvermajor}.${_pkgverminor}"
    patch --input=${srcdir}/modelio.patch modelio.sh
}

#build() {
#}

#check() {
#}

package() {
    install -dm755 "${pkgdir}/usr/share/applications/"
    install -dm755 "${pkgdir}/opt/modelio"
    install -Dm755 "${srcdir}/modelio.desktop" "${pkgdir}/usr/share/applications/"
    cp -r "${srcdir}"/usr/lib/modelio-open-source${_pkgvermajor}.${_pkgverminor}/* "${pkgdir}/opt/modelio/"
}
