# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Steffen Weber <-boenki-gmx-de->
# Contributor: Dan Serban
# Contributor: Henrik Olsson

pkgname=sunflower
_pkgver=0.4-62
pkgver=${_pkgver//-/.}
pkgrel=4
pkgdesc="Small and highly customizable twin-panel file manager for Linux with support for plugins"
arch=(any)
license=(GPL3)
url="https://sunflower-fm.org"
depends=(gtk3 vte3 python-gobject python-chardet librsvg)
makedepends=(libnotify)
optdepends=('libnotify'
            'python-mutagen: audio-metadata support'
            'gvfs: mount-management')
source=("https://github.com/MeanEYE/Sunflower/releases/download/0.4-62/sunflower-${_pkgver}.tgz")
sha256sums=('f2c47e58efb460f18b4bbaf839a9765ac0e2ae1805d7cbd04b3e345d2d74e900')

build() {
  cd "${srcdir}/Sunflower"
  python setup.py build
}

package() {
  cd "${srcdir}/Sunflower"
  _pyver=$(python -c "from sys import version_info; print(\"%d.%d\" % (version_info[0],version_info[1]))")

  python setup.py install --root="$pkgdir/" --optimize=1  --skip-build
  install -Dm644 images/sunflower.svg "${pkgdir}"/usr/lib/python${_pyver}/site-packages/images/sunflower.svg
  install -Dm644 images/sunflower.png "${pkgdir}/usr/share/pixmaps/sunflower.png"
  rm -rd "${pkgdir}/usr/images"
  cp -r "${srcdir}"/Sunflower/translations/ "${pkgdir}/usr/share/locale"
}
