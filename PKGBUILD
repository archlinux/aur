pkgname=gpg-utilities
pkgver=2021
pkgrel=1
pkgdesc='Utilities for GnuPG security tool.'
arch=('any')
url='https://github.com/tlikonen/gpg-utilities'
license=('custom:Creative Common CC0')
depends=('graphviz' 'gnupg' 'sbcl')
makedepends=('git' 'wget')
source=(
    "git+${url}.git#tag=${pkgver}"
    "https://creativecommons.org/publicdomain/zero/1.0/legalcode"
    )
sha256sums=('SKIP'
            '7dd923ade699ed91013a9b85fff3c8e5386de24c0d2d716a890f1f49b24d1d6e')

build(){
    cd "${srcdir}/gpg-utilities"
    make prefix=/usr all -j1
}
package(){
    cd "${srcdir}/gpg-utilities"
    make bindir="${pkgdir}/usr/bin" libdir="${pkgdir}/usr/lib" install
    install -Dm644 "${srcdir}/legalcode" "${pkgdir}/usr/share/licenses/gpg-utilities/LICENSE.xhtml"
}
