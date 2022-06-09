# Maintainer: Konstantin Shalygin <k0ste@k0ste.ru>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>

pkgbase='crush'
pkgname=("python-${pkgbase}")
pkgver='1.0.35'
pkgrel='2'
pkgdesc='Library to control placement in a hierarchy.'
arch=('any')
url="https://github.com/ceph/python-${pkgbase}"
makedepends=('python' 'python-setuptools' 'python-d2to1'
    'python-pbr' 'cmake' 'python-sphinx' 'python-mock' 'libatomic_ops')
depends=('python-d2to1' 'python-numpy' 'python-pandas' 'python-pbr'
    'python-pyparsing' 'python-dateutil' 'python-pytz' 'python-six'
    'python-appdirs' 'python-packaging')
license=('GPL')
source=("https://files.pythonhosted.org/packages/source/c/${pkgbase}/${pkgbase}-${pkgver}.tar.gz")
sha256sums=('a0cfb6166965a9cf19d479a14a2909e02af67775772773eb91ab3089b8e2e759')

prepare() {
  # https://github.com/ceph/python-crush/pull/3
  cd "${srcdir}/${pkgbase}-${pkgver}"

  # https://github.com/ceph/python-crush/pull/3
  sed -i 's|extension-crush.libcrush|extension=crush.libcrush|g' docs/dev/hacking.rst
}

build() {
  cd "${srcdir}/${pkgbase}-${pkgver}"
  python setup.py build_sphinx
}

package() {
  cd "${srcdir}/${pkgbase}-${pkgver}"
  python setup.py install -O1 --root="${pkgdir}"

  mkdir -p "${pkgdir}/usr/share/doc/python-${pkgbase}"
  cp -ax "build/html/"* "${pkgdir}/usr/share/doc/python-${pkgbase}"
}
