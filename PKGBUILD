# former Maintainer: Thomas Fanninger <thomas AT fanninger DOT at>
# Contributor: Mohammed Yaseen Mowzer <moyamodehacker@gmail.com>
# Contributor: Hugo Osvaldo Barrera <hugo@barrera.io>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname='python-yowsup'
pkgdesc='The open source cross platform Whatsapp library powering Wazapp - Python 2'
pkgver=3.2.3
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
sha512sums=('a1be36df5dc632071385cf0e252a208efb8982df98966d2c5a7b7558c626112e1ac2688be25fb6de1db9e9e04d36ab96784e589aeb90fcc6c6770edac791e568')

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
