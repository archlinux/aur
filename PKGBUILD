# Maintainer: Andrea Pascal <andrea@anodium.net>

pkgbase=python-muselsl
pkgname=(python-muselsl python2-muselsl)
pkgver=2.0.2
pkgrel=1
pkgdesc='Stream and visualize EEG data from the Muse headset.'
url='https://github.com/alexandrebarachant/muse-lsl'
arch=('any')
license=('BSD')
provides=('muselsl')
depends=('python-pylsl=1.10.5'
         'python-pygatt'
         'python-scikit-learn'
         'python-seaborn')
optdepends=('python-mne: Viewer V2'
            'python-vispy: Viewer V2')
source=('https://files.pythonhosted.org/packages/21/31/bc2c0fcff2a01054df803bdf070def7ff835e58ee7ea829479bd29d97633/muselsl-2.0.2.tar.gz')
sha384sums=('3f764491be01299027534692f25ad89c536098032bc82a9d24f2b63a45daa180383a863b73680e9440254fc2943ea4ac')

build(){
  cd "${srcdir}/muselsl-${pkgver}"
  python setup.py build
  python2 setup.py build
}

check(){
  cd "${srcdir}/muselsl-${pkgver}"
  python setup.py check -m -s
  python2 setup.py check -m -s
}

package_python-muselsl() {
  depends+=('python'
           'python-bitstring'
           'python-pandas'
           'python-numpy'
           'python-pexpect')
  makedepends=('python-setuptools')
  cd "${srcdir}/muselsl-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
  install -Dm 644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python2-muselsl() {
  depends+=('python2'
           'python2-bitstring'
           'python2-pandas'
           'python2-numpy'
           'python2-pexpect')
  makedepends=('python2-setuptools')
  cd "${srcdir}/muselsl-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
  install -Dm 644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
