# Maintainer: Joost Bremmer <contact@madeofmagicandwires.online>
# Contributor: Tomas Kral <tomas.kral@gmail.com>
pkgname=nvpy
pkgver=2.3.1
pkgrel=1
pkgdesc="Simplenote syncing note-taking application, but uglier and cross-platformerer."
arch=("any")
url="https://github.com/cpbotha/nvpy"
license=("BSD")
depends=(
  "python"
  "python-docutils"
  "python-markdown"
  "python-setuptools"
  "python-simplenote"
  "tk"
)
provides=("$pkgname")
conflicts=("${pkgname}-git")
source=("https://github.com/cpbotha/${pkgname}/archive/v${pkgver}.tar.gz")
install=nvpy.install
sha256sums=('f3c400623cd63ebd830df64fc39be1f5a68ce48e6d76b079d6d3713decf0bb28')

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  python ./setup.py build
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build

  # install example config to /usr/share
  install -Dvm644 "${pkgname}/${pkgname}-example.cfg" \
    "${pkgdir}/usr/share/${pkgname}/${pkgname}.cfg"

  # add license
  mkdir -p  $pkgdir/usr/share/licenses/$pkgname
  cp LICENSE.txt  $pkgdir/usr/share/licenses/$pkgname/LICENSE

}

# vim: set ts=2 sts=2 sw=2 et :
