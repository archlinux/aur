# Maintainer: Nico <desoxhd@gmail.com>
pkgname=porto-python
pkgver=0.0.2
pkgrel=1
pkgdesc="Edit Jupyter notebooks on the desktop - written in Python with Gtk"
arch=('any')
url="https://www.cvfosammmm.org/porto/"
license=('GPL3')
depends=('hicolor-icon-theme' 'sagemath' 'python-bleach' 'python-markdown' 'python-pypandoc' 'python-jupyter_client' 'python-ipykernel' 'jupyter-nbformat' 'gtk3' 'gtksourceview3' 'pygobject-devel')
makedepends=('tar')
source=("https://github.com/cvfosammmm/Porto/archive/v${pkgver}.tar.gz" "porto.sh")
sha256sums=('7c786c215d2bb4d68f36500505a7614071ebcdbfb94c4b85559e5e33b4f56b73' '451a05ac1ad44580dbab838458adcf3d1ece9c74febb679272d514a54e02d10c')

package() {
  cd "${srcdir}/Porto-${pkgver}"
  
  # install libraries
  # TODO: i am unsure if this is the correct way of doing this
  mkdir -p "${pkgdir}/usr/lib/porto/"
  cp -r app "${pkgdir}/usr/lib/porto/"
  cp -r cell "${pkgdir}/usr/lib/porto/"
  cp -r dialogs "${pkgdir}/usr/lib/porto/"
  cp -r helpers "${pkgdir}/usr/lib/porto/"
  cp -r resources "${pkgdir}/usr/lib/porto/"
  cp -r result_factory "${pkgdir}/usr/lib/porto/"
  cp -r notebook "${pkgdir}/usr/lib/porto/"
  cp -r workspace "${pkgdir}/usr/lib/porto/"
  install -Dm 755 "__main__.py" "${pkgdir}/usr/lib/porto/porto"
  
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
