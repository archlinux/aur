#  Maintainer: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>

pkgname=lets-encrypt-preview-git
_pkgname=letsencrypt
pkgver=2103.922f8e5
pkgrel=1
pkgdesc="A utility that works alongside Apache and nginx to automatically obtain a certificate and convert a website to HTTPS"
arch=('any')
license=('Apache')
url="https://letsencrypt.org/"
depends=('python' 'python-augeas' 'python-setuptools' 'dialog' 'openssl' 'gcc' 'swig' 'libffi')
makedepends=('git')
source=("${_pkgname}"::"git+https://github.com/letsencrypt/lets-encrypt-preview")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
    cd "${srcdir}/${_pkgname}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}"
    python setup.py install --root="${pkgdir}"
}

