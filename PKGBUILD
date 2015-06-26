#  Maintainer: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>

pkgname=lets-encrypt-preview-git
_pkgname=letsencrypt
pkgver=2309.3705594
pkgrel=1
pkgdesc="A utility that works alongside Apache and nginx to automatically obtain a certificate and convert a website to HTTPS"
arch=('any')
license=('Apache')
url="https://letsencrypt.org/"
depends=('python' 'augeas' 'ca-certificates' 'dialog' 'openssl' 'gcc' 'swig' 'libffi' 'git')
#makedepends=('python-virtualenv')
source=("${_pkgname}"::"git+https://github.com/letsencrypt/letsencrypt")
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
