# Maintainer: Peter Mattern <pmattern at arcor dot de>

pkgname=thunderbird-extension-cardbook
pkgver=76.1
_commit=ce6741e4c61628cb787627fae4c6126c3d8f83dd
pkgrel=1
pkgdesc="A mew Thunderbird address book based on the CardDAV and vCard standards"
arch=('any')
url='https://gitlab.com/cardbook/cardbook'
license=('MPL2')
depends=('thunderbird')
conflicts=('thunderbird<91')
source=("${url}/-/archive/${_commit}/${pkgname#thunderbird-extension-}-${pkgver}.tar.gz")
sha256sums=('ab0d477cf415b9eb7e4664f0b18df69d4eafa11dba9b5577fd3d3af306532614')

build() {
    cd CardBook-${_commit}
    export _archivefilename=$(grep id manifest.json | awk -F \" '{print $4}')
    bsdtar -caf ${srcdir}/$_archivefilename.zip chrome _locales background.js manifest.json
}

package() {
    install -D -m644 $_archivefilename.zip ${pkgdir}/usr/lib/thunderbird/extensions/$_archivefilename.xpi
}
