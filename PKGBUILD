# Maintainer: Kartik Mohta <kartikmohta@gmail.com>

pkgbase='python-catkin_tools'
pkgname=('python-catkin_tools')
_module='catkin_tools'
pkgver='0.4.5'
pkgrel=2
pkgdesc="Command line tools for working with catkin."
url="http://catkin-tools.readthedocs.org/"
depends=('python' 'python-catkin_pkg' 'python-osrf_pycommon' 'python-yaml')
provides=('python-catkin-tools')
conflicts=('python2-catkin_tools' 'python-catkin-tools')
makedepends=('python-setuptools')
license=('Apache')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz"
        "execution-controllers-python3.patch"
        "no-trollius.patch")
sha256sums=('50ebfd047a74e657cb1f3e150976355e23afbda519c4cecf63d7f548477730c3'
            'c56697c2d8baaca3c586d0c6479739b1b992d82b99332822bcc35c95bb577ac4'
            'fde6d6dbfbea40c7ad4114937dcea447c22c00fbfccf189716f93894cc245d4c')

prepare() {
    cd "${srcdir}/${_module}-${pkgver}"
    patch -p1 -i "${srcdir}/execution-controllers-python3.patch"
    patch -p1 -i "${srcdir}/no-trollius.patch"
}

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
