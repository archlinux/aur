# Maintainer: Peter Mattern <pmattern at arcor dot de>

pkgname=thunderbird-extension-cardbook
pkgver=82.0
_commit=0483b2c384d7a15b206a94b14ed189af5fd2b376
pkgrel=1
pkgdesc="A mew Thunderbird address book based on the CardDAV and vCard standards"
arch=('any')
url='https://gitlab.com/cardbook/cardbook'
license=('MPL2')
depends=('thunderbird')
conflicts=('thunderbird<102' 'thunderbird>=103')
source=("${url}/-/archive/${_commit}/${pkgname#thunderbird-extension-}-${pkgver}.tar.gz")
sha256sums=('d4c491b8dc32e92fbcb8292c9d93f8adf7e7326948f98f2df50976a5751307d1')

build() {
    cd CardBook-${_commit}
    export _archivefilename=$(grep id manifest.json | awk -F \" '{print $4}')
    bsdtar -caf ${srcdir}/$_archivefilename.zip chrome _locales background.js manifest.json
}

package() {
    install -D -m644 $_archivefilename.zip ${pkgdir}/usr/lib/thunderbird/extensions/$_archivefilename.xpi
}
