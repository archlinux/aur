# Maintainer: degreeme <suratovvlad@gmail.com>

pkgname=texstudio-dark-git
pkgver=2.12.2.r4.gcc40553
pkgrel=1
pkgdesc="Integrated writing environment for creating LaTeX documents. Dark version."
arch=('i686' 'x86_64')
url="http://texstudio.sourceforge.net/"
license=('GPL')
depends=('poppler-qt5' 'qt5-svg' 'qt5-script' 'libxkbcommon-x11' 'libqdark-git')
makedepends=('qt5-tools')
optdepends=('evince: pdf reader'
            'okular: alternate pdf reader')
conflicts=('texstudio')
source=("${pkgname%-*}::git+https://github.com/suratovvlad/texstudio_dark.git")
sha512sums=('SKIP')

pkgver() {
  cd ${pkgname%-*}

  _tag=$(git tag -l --sort -v:refname | sed -n '1,1{s/release-//p}')
  _rev=$(git rev-list --count release-${_tag}..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash"
}


build() {
    cd ${pkgname%-*}
    qmake-qt5 CONFIG-="debug" texstudio.pro
    make
}

package() {
    cd ${pkgname%-*}
    make INSTALL_ROOT="$pkgdir" install
}