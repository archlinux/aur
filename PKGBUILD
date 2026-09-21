# Maintainer: Peter Mattern <pmattern at arcor dot de>

pkgname=thunderbird-extension-cardbook
pkgver=106.4
_commit=57713229dc65bdefd53fbc8e1012d49b2c3a879e
pkgrel=1
pkgdesc="A new Thunderbird address book based on the CardDAV and vCard standards"
arch=('any')
url='https://gitlab.com/cardbook/cardbook'
license=('MPL-2.0')
depends=('thunderbird')
conflicts=('thunderbird<128' 'thunderbird>=157')
source=("${url}/-/archive/${_commit}/${pkgname#thunderbird-extension-}-${pkgver}.tar.gz")
sha256sums=('e44999bef5bc387723bcd969d55960527c8c1c5b9641a562d200c052307c24ac')

build() {
    cd CardBook-${_commit}
    export _archivefilename=$(grep '"id"' manifest.json | awk -F \" '{print $4}')
    bsdtar -caf ${srcdir}/$_archivefilename.zip chrome _locales background.html background.js LICENSE manifest.json policy.md README.md VENDOR.md
}

package() {
    install -D -m644 $_archivefilename.zip ${pkgdir}/usr/lib/thunderbird/extensions/$_archivefilename.xpi
}
