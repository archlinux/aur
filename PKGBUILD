# Maintainer: Peter Mattern <pmattern at arcor dot de>

pkgname=thunderbird-extension-cardbook
pkgver=120.8
_commit=76674281d1394f1892736b5918c7be1c9ead50f2
pkgrel=1
pkgdesc='A new Thunderbird address book based on the CardDAV and vCard standards'
arch=('any')
url='https://gitlab.com/cardbook/cardbook'
license=('MPL-2.0')
depends=('thunderbird')
conflicts=('thunderbird<128' 'thunderbird>=163')
source=("${url}/-/archive/${_commit}/${pkgname#thunderbird-extension-}-${pkgver}.tar.gz")
sha256sums=('00eb22bf4c889eb1ac3a6a865649b147cedb35fb0b9bcc746da581da2adfc93a')

build() {
    cd CardBook-${_commit}
    export _archivefilename=$(grep '"id"' manifest.json | awk -F \" '{print $4}')
    bsdtar -caf "${srcdir}"/${_archivefilename}.zip chrome experiments _locales background.html background.js LICENSE manifest.json policy.md README.md VENDOR.md
}

package() {
    install -D -m644 ${_archivefilename}.zip "${pkgdir}"/usr/lib/thunderbird/extensions/${_archivefilename}.xpi
}
