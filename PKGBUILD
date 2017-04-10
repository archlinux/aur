# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Andrey Mikhaylenko <neithere at gmail dot com>

pkgbase=python-argcomplete
pkgname=('python-argcomplete' 'python2-argcomplete')
_pyname=argcomplete
pkgver=1.8.2
pkgrel=1
pkgdesc='Easy, extensible command line tab completion of arguments for your Python script'
url='https://github.com/kislyuk/argcomplete'
arch=('any')
license=('Apache')
makedepends=('python-setuptools' 'python2-setuptools')
checkdepends=('python-pexpect' 'python2-pexpect' 'tcsh')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/kislyuk/${_pyname}/archive/v${pkgver}.tar.gz)
sha512sums=('96fa07bd6bc02989c6b42f21d6c2920d1cc853fd7f145d1c9b73fd179a14e2a10529c4bfb457ab92b9647be656020a645dbb26107913e13b0a693b7d424c352d')

check() {
  cd ${_pyname}-${pkgver}
  LC_CTYPE=en_US.UTF-8 python test/test.py -v
  LC_CTYPE=en_US.UTF-8 python2 test/test.py -v
}

package_python-argcomplete() {
  depends=('python')
  cd ${_pyname}-${pkgver}
  python setup.py install -O1 --root="${pkgdir}"
}

package_python2-argcomplete() {
  depends=('python2')
  cd ${_pyname}-${pkgver}
  python2 setup.py install -O1 --root="${pkgdir}"
  mv "${pkgdir}/usr/bin/activate-global-python-argcomplete" \
    "${pkgdir}/usr/bin/activate-global-python2-argcomplete"
  mv "${pkgdir}/usr/bin/python-argcomplete-check-easy-install-script" \
    "${pkgdir}/usr/bin/python2-argcomplete-check-easy-install-script"
  mv "${pkgdir}/usr/bin/register-python-argcomplete" \
    "${pkgdir}/usr/bin/register-python2-argcomplete"
  mv "${pkgdir}/usr/bin/python-argcomplete-tcsh" \
    "${pkgdir}/usr/bin/python2-argcomplete-tcsh"
}

# vim: ts=2 sw=2 et:
