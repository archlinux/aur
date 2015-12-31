# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=python2-django-assets
pkgver=0.11
pkgrel=2
pkgdesc="Asset management for Django, to compress and merge CSS and Javascript files"
arch=('any')
license=('BSD')
url="https://github.com/miracle2k/${pkgbase}/"
depends=('python2' 'python2-django' 'python2-webassets')
makedepends=('python2-setuptools')
source=("https://github.com/miracle2k/${pkgbase}/archive/${pkgver}.tar.gz"
        "https://github.com/miracle2k/django-assets/commit/9e7ab78fd1cea466a4811b9244b096a87d34c100.patch"
        "https://github.com/miracle2k/django-assets/commit/d32a7d8ca59555e0d6f452cd18ccd6e01e3211f6.patch")
md5sums=('97f7ce3ba6019d90865e0f4f6ac2c0b7'
         'd9852d3d38b52d2c6d23109e96fa2f7f'
         '6ba2a668dff4fdff71cfa5f27432c2ae')

prepare() {
  cd "${srcdir}/django-assets-${pkgver}"

  patch -Np1 < "${srcdir}/9e7ab78fd1cea466a4811b9244b096a87d34c100.patch"
  patch -Np1 < "${srcdir}/d32a7d8ca59555e0d6f452cd18ccd6e01e3211f6.patch"
}

package() {
  cd "${srcdir}/django-assets-${pkgver}"

  python2 setup.py install --root="${pkgdir}" -O1
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
