# Maintainer: Michael Herold <arch@michaeljherold.com>
# Maintainer: Ainola

pkgname=scudcloud
pkgver=1.31
pkgrel=2
pkgdesc="A Slack client for Linux"
arch=('any')
url="https://github.com/raelgc/scudcloud"
license=('MIT')
depends=('python' 'python-setuptools' 'python-dbus' 'python-pyqt4' 'hunspell-en')
groups=('messaging')
source=("https://github.com/raelgc/scudcloud/archive/v${pkgver}.tar.gz"
        'fix-message-editing.patch')
sha256sums=('3503390731ae18fad36fc6af26bfb81e2987e289b67649b881e19d7a211095d1'
            '5c4c8d6846c51b7b1f2e0c3ad165aaf112975c8f9208b6d1b261b5613537cf68')

prepare(){
    # Fixes message editing until pushed officially
    # See https://github.com/raelgc/scudcloud/issues/459
    patch -d "${pkgname}-${pkgver}" -p1 < fix-message-editing.patch
}

package() {
    cd "${pkgname}-${pkgver}"
    python setup.py install --prefix=/usr --root="${pkgdir}"
    rm -rf "${pkgdir}/usr/share/icons/ubuntu"**
}

# -*- mode: bash;-*-
