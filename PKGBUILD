# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Steffen Weber <-boenki-gmx-de->
# Contributor: Dan Serban
# Contributor: Henrik Olsson

pkgname=sunflower
_pkgver=0.5-63
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Small and highly customizable twin-panel file manager for Linux with support for plugins"
arch=(any)
license=(GPL3)
url="https://sunflower-fm.org"
depends=(gtk3 vte3 python python-gobject python-chardet python-cairo librsvg)
makedepends=(python-setuptools libnotify)
optdepends=('libnotify'
            'python-mutagen: audio-metadata support'
            'gvfs: mount-management')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/MeanEYE/Sunflower/archive/refs/tags/${_pkgver}.tar.gz")
sha256sums=('cfffdd6c6b7628104200768ae6e594f8547073a82e016bb13efec6d73358ec30')

build() {
  cd "${srcdir}/Sunflower-${_pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/Sunflower-${_pkgver}"
  #_pyver=$(python -c "from sys import version_info; print(\"%d.%d\" % (version_info[0],version_info[1]))")

  python setup.py install --root="$pkgdir/" --optimize=1  --skip-build
  #install -Dm644 images/sunflower.svg "${pkgdir}"/usr/lib/python${_pyver}/site-packages/images/sunflower.svg
  install -Dm644 images/sunflower.png "${pkgdir}/usr/share/pixmaps/sunflower.png"
  cp -r translations/ "${pkgdir}/usr/share/locale"
  rmdir "${pkgdir}/usr/share/sunflower/translations"
}
