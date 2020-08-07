# Contributor: Baptiste Grenier <baptiste@bapt.name>
# Contributor: Pablo Olmos de Aguilera Corradini <pablo <at] glatelier (dot} org>
# Maintainer: Sander van Kasteel <info at sandervankasteel dot nl>
pkgname=gtg-git
pkgver=r5730.6623731f
pkgrel=1
pkgdesc="Personal GTD like organizer for the GNOME desktop environment. Git version."
url="https://wiki.gnome.org/Apps/GTG"
arch=('x86_64')
license=('GPL')
depends=('pygtk' 'python-gobject' 'python-configobj' 'dbus-python'
'hicolor-icon-theme' 'desktop-file-utils' 'python2-gnomekeyring'
'python-liblarch-git' 'python-cairo' 'python-pyxdg' 'python-lxml')
makedepends=('git' 'python-gobject' 'meson')
optdepends=(
'pdftk: for Export and print plugin'
'python-cheetah3: for Export and print plugin'
'python2-libappindicator: for Notification area plugin (python-appindicator)'
'texlive-bin: for Export and print plugin (for pdflatex)'
'texlive-core: for Export and print plugin (for pdfjam)'
)
install="${pkgname}.install"
source=("${pkgname}::git+https://github.com/getting-things-gnome/gtg")

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}"
  arch-meson -Dprofile=development build

  ninja -C build
}

package() {
  cd "${srcdir}/${pkgname}"
  DESTDIR="$pkgdir" ninja -C build install

  install -d "${pkgdir}"/usr
}

sha256sums=('SKIP')
