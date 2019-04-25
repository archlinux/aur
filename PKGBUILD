# former Maintainer: Thomas Fanninger <thomas AT fanninger DOT at>
# Contributor: Mohammed Yaseen Mowzer <moyamodehacker@gmail.com>
# Contributor: Hugo Osvaldo Barrera <hugo@barrera.io>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=('python-yowsup' 'python2-yowsup')
pkgdesc='The open source cross platform Whatsapp library powering Wazapp - Python 2'
pkgver=3.1.0
pkgrel=1
pkgdesc="The open source cross platform Whatsapp library powering Wazapp"
url="https://github.com/tgalal/yowsup"
arch=('any')
license=('GPL')
makedepends=('python2-setuptools' 'python2-dateutil' 'python2-argparse' 'python2-axolotl' 'python2-pillow' 'python-setuptools' 'python-six' 'python2-six')
provide=('python-yowsup')
conflicts=('yowsup-client-git' 'python-yowsup-git')
source=("${pkgname}-${pkgver}.tag.gz::https://github.com/tgalal/yowsup/archive/v${pkgver}.tar.gz")
sha512sums=('54ab6a53b412ec805c593e7dc0a2e59e5add877543dc6fc7c103cf524f4725606437fc8b013932abe87ae1a059c6a589d1f1c2500e2ead385a600b8bd80efbc8')

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
