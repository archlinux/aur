# Maintainer: Mr. Outis <mroutis@protonmail.com>
pkgname=dvc
pkgver=0.27.0
pkgrel=1
pkgdesc="Open-source version control system for data science projects"
arch=('any')
url="https://github.com/iterative/${pkgname}"
license=('Apache')

makedepends=('git' 'python-setuptools')

depends=('python3' 'python-pyaml' 'python-configobj'
         'python-ply' 'python-zc.lockfile' 'python-gitpython'
         'python-requests' 'python-colorama' 'python-future'
         'python-pillow' 'python-wcwidth' 'python-distro'
         'python-pyfiglet' 'python-networkx' 'python-pyasn1')

optdepends=('python-boto3: support for AWS S3 remote'
            'python-paramiko: support for SSH remote'
            'python-azure-storage: support for Azure remote'
            'hadoop: support for HDFS remote')

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz"
        'https://files.pythonhosted.org/packages/source/g/grandalf/grandalf-0.6.tar.gz'
        'https://files.pythonhosted.org/packages/source/j/jsonpath-rw/jsonpath-rw-1.4.0.tar.gz'
        'https://files.pythonhosted.org/packages/source/n/ntfsutils/ntfsutils-0.1.4.tar.gz'
        'https://files.pythonhosted.org/packages/source/n/nanotime/nanotime-0.5.2.tar.gz'
        'https://files.pythonhosted.org/packages/source/s/schema/schema-0.6.8.tar.gz'
        'https://files.pythonhosted.org/packages/source/c/configparser/configparser-3.5.0.tar.gz'
        'https://files.pythonhosted.org/packages/source/a/asciimatics/asciimatics-1.10.0.tar.gz')

sha256sums=('a2d7d6bb7f70f82f801c9273ef8081c577e0969039d00770064e8c72484a3e89'
            '7471db231bd7338bc0035b16edf0dc0c900c82d23060f4b4d0c4304caedda6e4'
            '05c471281c45ae113f6103d1268ec7a4831a2e96aa80de45edc89b11fac4fbec'
            '50c058ce3371a819606ff29e914e6555c4d6c2527bff0cd0ed20af5947703118'
            'c7cc231fc5f6db401b448d7ab51c96d0a4733f4b69fabe569a576f89ffdf966b'
            'fa1a53fe5f3b6929725a4e81688c250f46838e25d8c1885a10a590c8c01a7b74'
            '5308b47021bc2340965c371f0f058cc6971a04502638d4244225c49d80db273a'
            '9101b0b6885542f324980bbe13a772475cd6a12678f601228eaaea412db919ab')

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

  cd "${srcdir}/configparser-3.5.0"
  python3 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=0

  cd "${srcdir}/asciimatics-1.10.0"
  python3 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=0

  # Package
  cd "${srcdir}/${pkgname}-${pkgver}"
  python3 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=0

  install -Dm644 LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm644 scripts/completion/dvc.zsh \
    "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"

  install -Dm644 scripts/completion/dvc.bash \
    "${pkgdir}/etc/bash_completion.d/${pkgname}"
}
