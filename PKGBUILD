# Maintainer: Peter Mattern <pmattern at arcor dot de>

pkgname=thunderbird-extension-cardbook
pkgver=76.3
_commit=46c50faecbda60399984c9fa595c45af2149f1d3
pkgrel=1
pkgdesc="A mew Thunderbird address book based on the CardDAV and vCard standards"
arch=('any')
url='https://gitlab.com/cardbook/cardbook'
license=('MPL2')
depends=('thunderbird')
conflicts=('thunderbird<91')
source=("${url}/-/archive/${_commit}/${pkgname#thunderbird-extension-}-${pkgver}.tar.gz")
sha256sums=('f6fa0d8a0e7e64c9d447e74ba439ae7cce9c04366a099cfe1062a5f816ef53c7')

build() {
    cd CardBook-${_commit}
    export _archivefilename=$(grep id manifest.json | awk -F \" '{print $4}')
    bsdtar -caf ${srcdir}/$_archivefilename.zip chrome _locales background.js manifest.json
}

package() {
    install -D -m644 $_archivefilename.zip ${pkgdir}/usr/lib/thunderbird/extensions/$_archivefilename.xpi
}
