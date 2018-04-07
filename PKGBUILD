# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgbase=pdb-clone
pkgname=('python-pdb-clone' 'python2-pdb-clone')
pkgver=1.10.1
pkgrel=1
pkgdesc='Clone of pdb, fast and with the remote debugging and attach features'
url='https://github.com/corpusops/pdbclone'
arch=('x86_64')
license=('GPL2')
makedepends=('glibc' 'python' 'python2')
source=(https://pypi.org/packages/source/p/${pkgbase}/${pkgbase}-${pkgver}.zip)
sha512sums=('70470d8fb33deb46c49fd2e072c1b6aa24c0397d21417f0ab1f63c1e05d8ff9797ba10a6c4ff350c29dd3b94ff6175110cb80971b4f0d16e922f948490773070')

prepare() {
  cp -a ${pkgbase}-${pkgver}{,-py2}
}

build() {
  msg2 'Building python...'
  (cd ${pkgbase}-${pkgver}
    python setup.py build
  )
  msg2 'Building python2...'
  (cd ${pkgbase}-${pkgver}-py2
    python2 setup.py build
  )
}

package_python-pdb-clone() {
  depends=('python' 'glibc')
  cd ${pkgbase}-${pkgver}
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr --skip-build
  install -Dm 644 README -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_python2-pdb-clone() {
  depends=('python2' 'glibc')
  cd ${pkgbase}-${pkgver}-py2
  python2 setup.py install -O1 --root="${pkgdir}" --prefix=/usr --skip-build
  install -Dm 644 README -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  mv "${pkgdir}/usr/bin/pdb-clone" "${pkgdir}/usr/bin/pdb-clone2"
  mv "${pkgdir}/usr/bin/pdb-attach" "${pkgdir}/usr/bin/pdb-attach2"
}

# vim: ts=2 sw=2 et:
