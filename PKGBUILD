# Maintainer: solnce <echo c29sbmNlQHJhdGFqY3phay5vbmU= | base64 -d>
pkgname=pacdef
pkgver=0.8.0
pkgrel=2
pkgdesc='declarative package manager for Arch Linux'
url='https://github.com/steven-omaha/pacdef'
source=("https://github.com/steven-omaha/${pkgname}/releases/download/v${pkgver}/${pkgname}-v${pkgver}.tar.xz")
arch=('any')
license=('GPL3')
depends=('python' 'pyalpm')
makedepends=('python-pip')
checkdepends=('python-pytest' 'python-mock')
sha256sums=('339f306c26a0805669295118a5256335c4b471ccd2b4b60e80639d27fc5623b9')

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m pytest -v
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  pip install --root="${pkgdir}/" --no-deps --ignore-installed .
  install -Dm644 _completion.zsh "${pkgdir}/usr/share/zsh/site-functions/_pacdef"
}
