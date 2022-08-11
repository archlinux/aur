# Maintainer: Peter Mattern <pmattern at arcor dot de>

pkgname=thunderbird-extension-cardbook
pkgver=76.6
_commit=6f2c462e189966be48ae31d81a74b9eec4d15ebd
pkgrel=1
pkgdesc="A mew Thunderbird address book based on the CardDAV and vCard standards"
arch=('any')
url='https://gitlab.com/cardbook/cardbook'
license=('MPL2')
depends=('thunderbird')
conflicts=('thunderbird<91')
source=("${url}/-/archive/${_commit}/${pkgname#thunderbird-extension-}-${pkgver}.tar.gz")
sha256sums=('e84577012bced9853ed5836f81ed129dbbfda2703f4c2c2731d5280e5c0ef434')

build() {
    cd CardBook-${_commit}
    export _archivefilename=$(grep id manifest.json | awk -F \" '{print $4}')
    bsdtar -caf ${srcdir}/$_archivefilename.zip chrome _locales background.js manifest.json
}

package() {
    install -D -m644 $_archivefilename.zip ${pkgdir}/usr/lib/thunderbird/extensions/$_archivefilename.xpi
}
