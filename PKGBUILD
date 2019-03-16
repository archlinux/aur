# Maintainer: Morten Linderud <morten@linderud.pw>  
pkgbase="python-anyconfig"
pkgname=("python-anyconfig" "python2-anyconfig")
pkgver=0.9.8
pkgrel=2
pkgdesc='Generic access to configuration files in any formats (to be in the future)'
url='https://github.com/ssato/python-anyconfig'
arch=('any')
license=('MIT')
makedepends=('python' 'python-setuptools'
             'python2' 'python2-setuptools')
checkdepends=('python-tox')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ssato/python-anyconfig/archive/RELEASE_${pkgver}.tar.gz")
sha256sums=('7154782890a30d605b050fe439ca18550d0ba1f2afa8a8ba4c76a1c228b05726')

build() {
    cd "${srcdir}/${pkgbase}-RELEASE_${pkgver}"
    python setup.py build
    python2 setup.py build
}

check(){
    cd "${srcdir}/${pkgbase}-RELEASE_${pkgver}"
    tox -e py2,py3
}

package_python-anyconfig() {
    depends=('python')
    cd "${srcdir}/${pkgbase}-RELEASE_${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -Dm644 LICENSE.MIT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python2-anyconfig() {
    depends=('python2')
    cd "${srcdir}/${pkgbase}-RELEASE_${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    mv "${pkgdir}/usr/bin/anyconfig_cli" "${pkgdir}/usr/bin/anyconfig_cli2"
    mv "${pkgdir}/usr/share/man/man1/anyconfig_cli.1" "${pkgdir}/usr/share/man/man1/anyconfig_cli2.1"
    install -Dm644 LICENSE.MIT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
# vim:set ft=sh ts=2 sw=2 et:
