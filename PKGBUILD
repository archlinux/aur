# Maintainer: rafaelsoaresbr <rafaelsoaresbr@gmail.com>
# Maintainer: llde 
# modelio-bin
# Contributing: https://github.com/rafaelsoaresbr/pkgbuild
# Builds: https://gitlab.com/rafaelsoaresbr/pkgbuild/builds
#pkgbase=
pkgname=modelio-bin

# Version
_pkgvermajor=4
_pkgverminor=0
_pkgverpatch=1
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
source_x86_64=("modelio-${pkgver}-x86_64.deb::https://sourceforge.net/projects/modeliouml/files/${pkgver}/modelio-open-source${_pkgvermajor}.${_pkgverminor}_${pkgver}_amd64.deb/download")
#noextract=()
#validpgpkeys=()
sha256sums=('af7e10bb2849fb9cdb2ec0054d782dedd5c6901cbf3e742d1ab872447ae38b5c'
            'bc87a815e0af78ece34ccbc878b88b17b9b00557a98c113cefc9b4111462dbbb')
sha256sums_x86_64=('ae5932f0265b8484f7ca544f93426be867e4118c8ae19cbebd3c08aa0fcfb709')

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
