# Maintainer: Marcus Hoffmann <bubu@bubu1.eu>

pkgname=python-cryptg
pkgver=0.2
pkgrel=1
pkgdesc="Cryptographic utilities for Telegram, designed to use with Telethon."
url="https://github.com/alisaifee/limits/"
depends=('python' 'python-cffi')
makedepends=('python-setuptools' 'libffi')
license=('CC0')
arch=('any')
source=("https://github.com/cher-nov/cryptg/archive/${pkgver}.tar.gz"
	"https://github.com/cher-nov/tiny-AES-c/archive/f8507b9f226416ba1f5d452ecaaf37a2fae982c3.zip")

sha256sums=('c3050874bfeff2c57c940dafb3dad0b96917e067ff98acad4aa73dd898c30758'
            'dfb0c7c2977ca018d8eff581319b959c4b72b5f59b2fc706519224edca591094')

prepare() {
     rmdir ${srcdir}/cryptg-${pkgver}/share/tiny-AES-c
     mv tiny-AES-c-f8507b9f226416ba1f5d452ecaaf37a2fae982c3/ ${srcdir}/cryptg-${pkgver}/share/tiny-AES-c
}

build() {
    cd "${srcdir}/cryptg-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/cryptg-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
