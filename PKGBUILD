# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: nemstar

pkgname=sunflower-git
pkgver=0.4.62.r211.g52f1a0d
pkgrel=2
pkgdesc="Small and highly customizable twin-panel file manager for Linux with support for plugins"
arch=(any)
license=(GPL3)
url="https://sunflower-fm.org"
depends=(gtk3 vte3 python python-gobject python-chardet python-cairo librsvg)
makedepends=(git python-setuptools libnotify)
optdepends=('libnotify'
            'python-mutagen: audio-metadata support'
            'gvfs: mount-management')
provides=(sunflower)
conflicts=(sunflower)
source=("git+https://github.com/MeanEYE/Sunflower.git#branch=v0.5")
sha256sums=('SKIP')

pkgver() {
  cd "Sunflower"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "Sunflower"
  python setup.py build
}

package() {
  cd "Sunflower"
  python setup.py install --root="$pkgdir/" --optimize=1  --skip-build
  install -Dm644 images/sunflower.png "${pkgdir}/usr/share/pixmaps/sunflower.png"
  rm "${pkgdir}/usr/share/sunflower/images/sunflower.png"
  rm -f "${pkgdir}"/usr/share/locale/*/LC_MESSAGES/*.po
  rm -f "${pkgdir}"/usr/share/locale/*.pot
}
