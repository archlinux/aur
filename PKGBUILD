# Mantainer: epitron <chris@ill-logic.com>
# Contributor: sxe <sxxe@gmx.de>

pkgname=falkon-git
_pkgname=falkon
pkgver=2.1.2.r4422.d42b1ecf
_pkgver=2.1.2
pkgrel=1
pkgdesc="Cross-platform Qt Web Browser "
arch=('i686' 'x86_64')
url="http://www.qupzilla.com"
license=('GPL')
depends=('qt5-webengine' 'qt5-x11extras' 'qt5-svg' 'hicolor-icon-theme' 'openssl>=1.1.0')
makedepends=('git' 'qt5-tools' 'kwallet' 'libgnome-keyring')
conflicts=('qupzilla' 'qupzilla-qt5' 'qupzilla-qt5-git' 'falkon')
optdepends=(
  'bash-completion: bash completion support'
  'kwallet: kf5 kwallet integration'
  'libgnome-keyring: gnome keyring integration'
  )
source=(
  "git://anongit.kde.org/falkon.git"
  )
sha256sums=(SKIP)

pkgver() {
  cd "$_pkgname"
  printf "$_pkgver.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_pkgname"

  export FALKON_PREFIX="/usr/"
  export KDE_INTEGRATION=true
  export GNOME_INTEGRATION=true

  qmake
  make
}

package() {
  cd "$_pkgname"
  make INSTALL_ROOT="$pkgdir/" install

  # zsh completion
  install -Dm644 linux/completion/_falkon "$pkgdir/usr/share/zsh/site-functions/_falkon"
}
