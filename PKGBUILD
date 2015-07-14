#  Maintainer: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>

pkgname=letsencrypt-git
_pkgname=letsencrypt
pkgver=2463.01481aa
pkgrel=1
pkgdesc="A utility that works alongside Apache and nginx to automatically obtain a certificate and convert a website to HTTPS"
arch=('any')
license=('Apache')
url="https://letsencrypt.org/"
depends=('python' 'augeas' 'ca-certificates' 'dialog' 'openssl' 'gcc' 'libffi' 'git')
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
