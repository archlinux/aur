# former Maintainer: Thomas Fanninger <thomas AT fanninger DOT at>
# Contributor: Mohammed Yaseen Mowzer <moyamodehacker@gmail.com>
# Contributor: Hugo Osvaldo Barrera <hugo@barrera.io>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=('python-yowsup' 'python2-yowsup')
pkgdesc='The open source cross platform Whatsapp library powering Wazapp - Python 2'
pkgver=2.5.2
pkgrel=1
pkgdesc="The open source cross platform Whatsapp library powering Wazapp"
url="https://github.com/tgalal/yowsup"
arch=('any')
license=('GPL')
makedepends=('python2-setuptools' 'python2-dateutil' 'python2-argparse' 'python2-axolotl' 'python2-pillow' 'python-setuptools')
provide=('python-yowsup')
conflicts=('yowsup-client-git' 'python-yowsup-git')
source=("${pkgname}-${pkgver}.tag.gz::https://github.com/tgalal/yowsup/archive/v${pkgver}.tar.gz")
sha512sums=('a4ae60420cebd744c7e16b740c1e46702572f6745239106be18075b58e076cc39d778f8911c0981519588fb0cfea852e0cef8542f0b10c229aff4b04b8d40ec4')

build(){
    cd $srcdir
}

package_python-yowsup() {
    cd "${srcdir}/yowsup-${pkgver}"
    depends=('python' 'python-dateutil' 'python-argparse' 'python-axolotl' 'python-pillow')

    cd "${srcdir}/yowsup-${pkgver}"
    python setup.py install --prefix=/usr --root=$pkgdir --optimize=1
    mkdir -p "$pkgdir"/usr/share/
    mv "$pkgdir"/usr/yowsup "$pkgdir"/usr/share/yowsup
}

package_python2-yowsup() {
    depends=('python2' 'python2-dateutil' 'python2-argparse' 'python2-axolotl' 'python2-pillow')

    cd "${srcdir}/yowsup-${pkgver}"
    python2 setup.py install --prefix=/usr --root=$pkgdir --optimize=1
    mkdir -p "$pkgdir"/usr/share/
    mv "$pkgdir"/usr/yowsup "$pkgdir"/usr/share/yowsup
}

check(){
    cd "${srcdir}/yowsup-${pkgver}"
    python2 setup.py test
}
