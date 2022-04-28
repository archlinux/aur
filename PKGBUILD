# Maintainer: Peter Mattern <pmattern at arcor dot de>

pkgname=thunderbird-extension-cardbook
pkgver=75.0
_commit=79641b46fec3f70d73cef150a6a08fbde5922bb5
pkgrel=1
pkgdesc="A mew Thunderbird address book based on the CardDAV and vCard standards"
arch=('any')
url='https://gitlab.com/cardbook/cardbook'
license=('MPL2')
depends=('thunderbird')
conflicts=('thunderbird<91')
source=("${url}/-/archive/${_commit}/${pkgname#thunderbird-extension-}-${pkgver}.tar.gz")
sha256sums=('7e5e6cc74588f397bb64e6c957d37482ab01fa5ad1ce327fb1b31f17616ba28e')

build() {
    cd CardBook-${_commit}
    export _archivefilename=$(grep id manifest.json | awk -F \" '{print $4}')
    bsdtar -caf ${srcdir}/$_archivefilename.zip chrome _locales background.js manifest.json
}

package() {
    install -D -m644 $_archivefilename.zip ${pkgdir}/usr/lib/thunderbird/extensions/$_archivefilename.xpi
}
