# Maintainer: Peter Mattern <pmattern at arcor dot de>

pkgname=thunderbird-extension-cardbook
pkgver=107.7
_commit=40cc9646181a0a2346cbef921fa6ee4cb55d7a94
pkgrel=1
pkgdesc="A new Thunderbird address book based on the CardDAV and vCard standards"
arch=('any')
url='https://gitlab.com/cardbook/cardbook'
license=('MPL-2.0')
depends=('thunderbird')
conflicts=('thunderbird<128' 'thunderbird>=161')
source=("${url}/-/archive/${_commit}/${pkgname#thunderbird-extension-}-${pkgver}.tar.gz")
sha256sums=('d283444ec0339a2651ce6a0a8670c58b57c552e61395771defad3bb473667fe8')

build() {
    cd CardBook-${_commit}
    export _archivefilename=$(grep '"id"' manifest.json | awk -F \" '{print $4}')
    bsdtar -caf "${srcdir}"/${_archivefilename}.zip chrome _locales background.html background.js LICENSE manifest.json policy.md README.md VENDOR.md
}

package() {
    install -D -m644 ${_archivefilename}.zip "${pkgdir}"/usr/lib/thunderbird/extensions/${_archivefilename}.xpi
}
