# Maintainer: solnce <echo c29sbmNlQHJhdGFqY3phay5vbmU= | base64 -d>
pkgname=pacdef
pkgver=0.7.3
pkgrel=1
pkgdesc='declarative package manager for Arch Linux'
url='https://github.com/steven-omaha/pacdef'
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/steven-omaha/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
arch=('any')
license=('GPL3')
depends=('python' 'pyalpm')
checkdepends=('python-pytest' 'python-mock')
sha256sums=('9b425b9bbb45d40dd3db001da12c0343337e4e54ecf91071d2d203c1d3536cf6')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  sed -i -e "s/VERSION = \"unknown\"/VERSION = \"${pkgver}\"/" pacdef.py
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  pytest -v
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 pacdef.py "${pkgdir}/usr/bin/pacdef"
  install -Dm644 _completion.zsh "${pkgdir}/usr/share/zsh/site-functions/_pacdef"
}
