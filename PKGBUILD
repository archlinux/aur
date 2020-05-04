# Maintainer: Joost Bremmer <contact@madeofmagicandwires.online>
# Contributor: Tomas Kral <tomas.kral@gmail.com>
pkgname=nvpy
pkgver=2.1.0
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
provides=("${pkgname}-git")
source=("https://github.com/cpbotha/${pkgname}/archive/v${pkgver}.tar.gz")
install=nvpy.install
sha256sums=('fd045f90660134154474318f7155b2fa0a439c7b00da85800d7d75c4650666e2')

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
