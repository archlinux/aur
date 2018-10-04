# Maintainer: Mr. Outis <mroutis@protonmail.com>
pkgname=dvc
pkgver=0.19.7
pkgrel=1
pkgdesc="Open-source version control system for data science projects"
arch=('any')
url="https://github.com/iterative/${pkgname}"
license=('Apache')

makedepends=('python3' 'python-setuptools' 'python-pyaml' 'python-configobj'
         'python-ply' 'python-zc.lockfile' 'python-gitpython'
         'python-requests' 'python-colorama' 'python-pyasn1'
         'python-future')

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz"
        'https://files.pythonhosted.org/packages/source/g/grandalf/grandalf-0.6.tar.gz'
        'https://files.pythonhosted.org/packages/source/j/jsonpath-rw/jsonpath-rw-1.4.0.tar.gz'
        'https://files.pythonhosted.org/packages/source/n/ntfsutils/ntfsutils-0.1.4.tar.gz'
        'https://files.pythonhosted.org/packages/source/n/nanotime/nanotime-0.5.2.tar.gz'
        'https://files.pythonhosted.org/packages/source/s/schema/schema-0.6.8.tar.gz'
        'https://files.pythonhosted.org/packages/source/n/networkx/networkx-2.1.zip'
        'https://files.pythonhosted.org/packages/source/c/configparser/configparser-3.5.0.tar.gz')

sha256sums=('a979aee1567093af3d6d8fc9ac94634e78e5769486dd8d019315dcf4024dc24d'
            '7471db231bd7338bc0035b16edf0dc0c900c82d23060f4b4d0c4304caedda6e4'
            '05c471281c45ae113f6103d1268ec7a4831a2e96aa80de45edc89b11fac4fbec'
            '50c058ce3371a819606ff29e914e6555c4d6c2527bff0cd0ed20af5947703118'
            'c7cc231fc5f6db401b448d7ab51c96d0a4733f4b69fabe569a576f89ffdf966b'
            'fa1a53fe5f3b6929725a4e81688c250f46838e25d8c1885a10a590c8c01a7b74'
            '64272ca418972b70a196cb15d9c85a5a6041f09a2f32e0d30c0255f25d458bb1'
            '5308b47021bc2340965c371f0f058cc6971a04502638d4244225c49d80db273a')

package() {
  # Dependencies
  cd "${srcdir}/grandalf-0.6"
  python3 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=0

  cd "${srcdir}/jsonpath-rw-1.4.0"
  python3 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=0

  cd "${srcdir}/ntfsutils-0.1.4"
  python3 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=0

  cd "${srcdir}/nanotime-0.5.2"
  python3 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=0

  cd "${srcdir}/schema-0.6.8"
  python3 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=0

  cd "${srcdir}/networkx-2.1"
  python3 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=0

  cd "${srcdir}/configparser-3.5.0"
  python3 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=0

  # Package
  cd "${srcdir}/${pkgname}-${pkgver}"
  python3 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=0
  install -D -m644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
