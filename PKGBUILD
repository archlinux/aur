# Maintainer: Ruben Deisenroth (Discord: Rubosplay#0815) <ruben.deisenroth@stud.tu-darmstadt.de>

pkgname=algotex-git
_pkgname=AlgoTeX
pkgver=r63.8efda68
pkgrel=1
pkgdesc='AlgoTeX - A LaTeX-Template based on tuda-ci used for FoP and AuD'
arch=('any')
url='https://github.com/TUDalgo/AlgoTeX'
license=('custom')
depends=('python-pip')
makedepends=()
source=("${pkgname}::git+https://github.com/TUDalgo/AlgoTeX.git")
sha256sums=('SKIP')

# Dynamically update Package Version from Git
pkgver() {
  cd ${pkgname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

# Build Package
package() {
    cd "${srcdir}/${pkgname}"
    # License
    install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
    # Create Package Directory
    mkdir -p "${pkgdir}/$(kpsewhich -var-value=TEXMFDIST)/tex/latex/${pkgname}"
    # Copy Files
    install -Dm644 tex/* "${pkgdir}/$(kpsewhich -var-value=TEXMFDIST)/tex/latex/${pkgname}/"

    # Install pygments
    echo "Installing pygments...(if pygments is already installed, this will print a warning)"
    pip install pygments
}