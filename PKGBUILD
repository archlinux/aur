# Maintainer: Tony Lambiris <tony@libpcap.net>

pkgbase=python-modulemd
pkgname=('python-modulemd' 'python2-modulemd')
pkgver=1.3.3
pkgrel=2
pkgdesc="A python library for manipulation of the proposed module metadata format."
arch=("any")
license=("MIT")
url="http://modulemd.readthedocs.io/en/latest/"
depends=("python3")
source=("https://files.pythonhosted.org/packages/7c/e3/b066246183455e8437774bb4408ef3f61f23adfca52efab6285160299378/modulemd-1.3.3.tar.gz")
sha256sums=('661a196187d8f69fdee04835ca3a7faae60b7fea9a5c61c8b142c19b6444f08b')

prepare() {
	cp -a "${pkgbase#python-}-${pkgver}" "${pkgbase#python-}-${pkgver}-py2"
	# change python to python2
	cd "${pkgbase#python-}-${pkgver}-py2"
	find . -name '*.py' -exec sed -i "s|python|python2|g" {} \;
}

build() {
  cd "${srcdir}/${pkgbase#python-}-${pkgver}"
  python ./setup.py build

  cd "${srcdir}/${pkgbase#python-}-${pkgver}-py2"
  python2 ./setup.py build
}

package_python-modulemd() {
  cd "${srcdir}/${pkgbase#python-}-${pkgver}"
  python ./setup.py install --root="${pkgdir}" --optimize=1
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python2-modulemd() {
  cd "${srcdir}/${pkgbase#python-}-${pkgver}"
  python2 ./setup.py install --root="${pkgdir}" --optimize=1
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
