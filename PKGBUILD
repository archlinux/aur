# Maintainer: Nico <d3sox at protonmail dot com>
pkgname=porto-python
pkgver=0.0.2
pkgrel=2
pkgdesc="Edit Jupyter notebooks on the desktop - written in Python with Gtk"
arch=('any')
url="https://www.cvfosammmm.org/porto/"
license=('GPL3')
depends=('hicolor-icon-theme' 'sagemath' 'python-bleach' 'python-markdown' 'python-pypandoc' 'python-jupyter_client' 'python-ipykernel' 'jupyter-nbformat' 'gtk3' 'gtksourceview3' 'python-gobject')
makedepends=('tar')
source=("https://github.com/cvfosammmm/Porto/archive/v${pkgver}.tar.gz" "porto.sh")
sha256sums=('7c786c215d2bb4d68f36500505a7614071ebcdbfb94c4b85559e5e33b4f56b73' 'd93f2f9678a4215ee2375ff3d2e2d5b45d517f30b2fdf5456f8233e0dd0dd458')

package() {
  _appfolder="${pkgdir}/opt/porto/"
  
  cd "${srcdir}/Porto-${pkgver}"
  
  # install python app files
  mkdir -p "${_appfolder}"
  cp -r app "${_appfolder}"
  cp -r cell "${_appfolder}"
  cp -r dialogs "${_appfolder}"
  cp -r helpers "${_appfolder}"
  cp -r resources "${_appfolder}"
  cp -r result_factory "${_appfolder}"
  cp -r notebook "${_appfolder}"
  cp -r workspace "${_appfolder}"
  install -Dm 755 "__main__.py" "${_appfolder}/porto"
  
  # install binary
  install -Dm 755 "${srcdir}/porto.sh" "${pkgdir}/usr/bin/porto"
  
  # install license
  install -Dm 644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 "COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
  # install icon
  install -Dm 664 "resources/images/org.cvfosammmm.Porto.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/org.cvfosammmm.Porto.svg"
  # install desktop file
  install -Dm 644 "resources/org.cvfosammmm.Porto.desktop" "${pkgdir}/usr/share/applications/porto.desktop"
}
