
pkgname=python2-openmdao
pkgver=0.13.0
pkgrel=1
pkgdesc="An open-source engineering analysis framework"
url="http://openmdao.org/"
arch=(any)
license=('apache')
depends=('python2-decorator' 'python2-mock' 'python2-networkx' 'python2-crypto' 'python2-pyparsing' 'python2-requests' 'python2-traits' 'python2-zope-interface' 'pyevolve' 'python2-pytz' 'python2-scipy'  'python2-decorator' 'python2-matplotlib' 'python2-jinja' 'python2-pygments')
makedepends=('python2-setuptools' 'python2-sphinx')
source=("https://github.com/OpenMDAO/OpenMDAO-Framework/archive/${pkgver}.tar.gz")
md5sums=('5de5c047aac13cc8d03791f50db54e26')

_modules="units util test main lib"

prepare() {
  for _mod in ${_modules}; do
    cd "${srcdir}/OpenMDAO-Framework-$pkgver/openmdao.${_mod}"
    sed -i "s|Traits==4.3.0|Traits>=4.3.0|g" setup.py
    sed -i "s|Sphinx==1.2.2|Sphinx>=1.2.2|g" setup.py
    sed -i "/pycrypto==2.3/d" setup.py
  done
}


build() {
  for _mod in ${_modules}; do
    cd "${srcdir}/OpenMDAO-Framework-$pkgver/openmdao.${_mod}"
    python2 setup.py build
  done
} 

package() {
  for _mod in ${_modules}; do
    cd "${srcdir}/OpenMDAO-Framework-$pkgver/openmdao.${_mod}"
    python2 setup.py install --root="${pkgdir}"
  done

  # conflict with python
  rm "${pkgdir}"/usr/bin/idle
}

