# former Maintainer: Thomas Fanninger <thomas AT fanninger DOT at>
# Contributor: Mohammed Yaseen Mowzer <moyamodehacker@gmail.com>
# Contributor: Hugo Osvaldo Barrera <hugo@barrera.io>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname='python-yowsup'
pkgdesc='The open source cross platform Whatsapp library powering Wazapp - Python 2'
pkgver=3.2.0
pkgrel=1
pkgdesc="The open source cross platform Whatsapp library powering Wazapp"
url="https://github.com/tgalal/yowsup"
arch=('any')
license=('GPL')
depends=('python' 'python-dateutil' 'python-argparse' 'python-axolotl' 'python-pillow' 'python-consonance-git' 'python-dissononce-git')
makedepends=('python-setuptools' 'python-six')
provide=('python-yowsup')
conflicts=('yowsup-client-git' 'python-yowsup-git')
source=("${pkgname}-${pkgver}.tag.gz::https://github.com/tgalal/yowsup/archive/v${pkgver}.tar.gz")
sha512sums=('f2261b0e184be7eae83d21c5ee31d60f5078f2484bc32b93bcc4766447e98ba5bc76b5797422684570fdd446a1673fcf9b6db95fb1b7a272bfe7df38dec37d37')

prepare() {
    sed -i "s/six==1.10/six>=1.10/" yowsup-${pkgver}/setup.py
}

package() {
    cd "${srcdir}/yowsup-${pkgver}"

    cd "${srcdir}/yowsup-${pkgver}"
    python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
    mkdir -p "$pkgdir"/usr/share/
    mv "$pkgdir"/usr/yowsup "$pkgdir"/usr/share/yowsup
}

check(){
    cd "${srcdir}/yowsup-${pkgver}"
    #python setup.py test
}
