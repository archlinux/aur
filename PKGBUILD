# former Maintainer: Thomas Fanninger <thomas AT fanninger DOT at>
# Contributor: Mohammed Yaseen Mowzer <moyamodehacker@gmail.com>
# Contributor: Hugo Osvaldo Barrera <hugo@barrera.io>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=('python-yowsup' 'python2-yowsup')
pkgdesc='The open source cross platform Whatsapp library powering Wazapp - Python 2'
pkgver=3.2.0
pkgrel=1
pkgdesc="The open source cross platform Whatsapp library powering Wazapp"
url="https://github.com/tgalal/yowsup"
arch=('any')
license=('GPL')
makedepends=('python2-setuptools' 'python2-dateutil' 'python2-argparse' 'python2-axolotl' 'python2-pillow' 'python-setuptools' 'python-six' 'python2-six')
provide=('python-yowsup')
conflicts=('yowsup-client-git' 'python-yowsup-git')
source=("${pkgname}-${pkgver}.tag.gz::https://github.com/tgalal/yowsup/archive/v${pkgver}.tar.gz")
sha512sums=('f2261b0e184be7eae83d21c5ee31d60f5078f2484bc32b93bcc4766447e98ba5bc76b5797422684570fdd446a1673fcf9b6db95fb1b7a272bfe7df38dec37d37')

prepare() {
    sed -i "s/six==1.10/six>=1.10/" yowsup-${pkgver}/setup.py
}

package_python-yowsup() {
    cd "${srcdir}/yowsup-${pkgver}"
    depends=('python' 'python-dateutil' 'python-argparse' 'python-axolotl' 'python-pillow')

    cd "${srcdir}/yowsup-${pkgver}"
    python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
    mkdir -p "$pkgdir"/usr/share/
    mv "$pkgdir"/usr/yowsup "$pkgdir"/usr/share/yowsup
}

package_python2-yowsup() {
    depends=('python2' 'python2-dateutil' 'python2-argparse' 'python2-axolotl' 'python2-pillow')

    cd "${srcdir}/yowsup-${pkgver}"
    python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
    mkdir -p "$pkgdir"/usr/share/
    mv "$pkgdir"/usr/yowsup "$pkgdir"/usr/share/yowsup
}

check(){
    cd "${srcdir}/yowsup-${pkgver}"
    #python setup.py test
}
