# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Thomas Fanninger <thomas AT fanninger DOT at>
# Contributor: Mohammed Yaseen Mowzer <moyamodehacker@gmail.com>
# Contributor: Hugo Osvaldo Barrera <hugo@barrera.io>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname='python-yowsup'
pkgdesc='The open source cross platform Whatsapp library powering Wazapp - Python 2'
pkgver=3.3.0
pkgrel=4
pkgdesc="The open source cross platform Whatsapp library powering Wazapp"
url="https://github.com/tgalal/yowsup"
arch=('any')
license=('GPL')
depends=('python' 'python-axolotl' 'python-consonance-git' 'python-dissononce-git' 'python-appdirs')
makedepends=('python-setuptools' 'python-six')
optdepends=('python-pillow: send images')
conflicts=('yowsup-client-git' 'python-yowsup-git')
source=("${pkgname}-${pkgver}.tag.gz::https://github.com/tgalal/yowsup/archive/v${pkgver}.tar.gz")
sha512sums=('304409f02aa3720b0f70a83fe4dbe288fa1c5659642878d7bd1354359524a66c39b9f5baa9899224497f61f974d9b64ba67e07d866fda2589413070bb9ef1aad')

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
