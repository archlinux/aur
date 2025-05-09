# Maintainer: Lucas Werkmeister <mail@lucaswerkmeister.de>

pkgname=ausweiskopie
pkgver=0.1.4
pkgrel=3
pkgdesc='Create privacy friendly and legal copies of your Ausweisdokument'
arch=(any)
license=('MPL-2.0')
url='https://github.com/Varbin/ausweiskopie'
depends=(
    'python'
    'python-pillow'
    'python-importlib_resources'
    'python-dbus'
    'python-gobject'
)
optdepends=(
    'python-ttkbootstrap: modern theme'
)
makedepends=(
    'git'
    'python-build'
    'python-installer'
    'python-setuptools-scm'
)
source=("git+https://github.com/Varbin/ausweiskopie.git#tag=v${pkgver}")
# use makepkg -g to update
sha256sums=('fe0aa197c02ab9addf993ee6e33c005b02b14a7e6643c2581472e200d620b995')

build() {
  cd "${srcdir}/${pkgname}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${pkgname}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -D -m644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -D -m644 "contrib/in.varb.Ausweiskopie.desktop" "${pkgdir}/usr/share/applications/in.varb.Ausweiskopie.desktop"
  install -D -m644 "contrib/in.varb.Ausweiskopie.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/in.varb.Ausweiskopie.svg"
}
