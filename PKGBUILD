# Contributor: Calimero <calimeroteknik@free.fr>

pkgname=lib_users
pkgver=0.15
pkgrel=1
pkgdesc='Checks /proc for libraries being mapped but marked as deleted'
arch=('any')
url='https://www.schwarzvogel.de/software/lib_users/'
license=('GPL2')

depends=("python")
makedepends=("python-setuptools")
source=("https://www.schwarzvogel.de/pkgs/${pkgname}-${pkgver}.tar.gz")
sha256sums=('3862f66ff15d74b5875503c99b18e2c0aff908e0bb2dcf611363eef800e1de8b')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  python setup.py install --prefix=/usr --root="${pkgdir}"
  for prog in "$pkgdir"/usr/bin/*; do mv "${prog}" "${prog%.py}";done

  install -D -m644 README.md "${pkgdir}/usr/share/doc/lib_users/README.md"
}
