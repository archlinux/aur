# Maintainer: solnce <echo c29sbmNlQHJhdGFqY3phay5vbmU= | base64 -d>
pkgname=pacdef
pkgver=0.8.0
pkgrel=1
pkgdesc='declarative package manager for Arch Linux'
url='https://github.com/steven-omaha/pacdef'
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/steven-omaha/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
arch=('any')
license=('GPL3')
depends=('python' 'pyalpm')
makedepends=('python-pip')
checkdepends=('python-pytest' 'python-mock')
sha256sums=('ddd013d083bd62f0611ff1cfb396b029866f21183f9ada3c5d0fd9e01f264766')

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m pytest -v
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  pip install --root="${pkgdir}/" --no-deps --ignore-installed .
  install -Dm644 _completion.zsh "${pkgdir}/usr/share/zsh/site-functions/_pacdef"
}
