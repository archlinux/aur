# Maintainer: Peter Mattern <pmattern at arcor dot de>

pkgname=thunderbird-extension-cardbook
pkgver=120.4
_commit=c1d4e8030a31dfa73f5d4b04b867879f705262fc
pkgrel=1
pkgdesc='A new Thunderbird address book based on the CardDAV and vCard standards'
arch=('any')
url='https://gitlab.com/cardbook/cardbook'
license=('MPL-2.0')
depends=('thunderbird')
conflicts=('thunderbird<128' 'thunderbird>=163')
source=("${url}/-/archive/${_commit}/${pkgname#thunderbird-extension-}-${pkgver}.tar.gz")
sha256sums=('790cfe7273e451e55dc6794bcb141284aa447a971869910bffdafb16bf590861')

build() {
    cd CardBook-${_commit}
    export _archivefilename=$(grep '"id"' manifest.json | awk -F \" '{print $4}')
    bsdtar -caf "${srcdir}"/${_archivefilename}.zip chrome _locales background.html background.js LICENSE manifest.json policy.md README.md VENDOR.md
}

package() {
    install -D -m644 ${_archivefilename}.zip "${pkgdir}"/usr/lib/thunderbird/extensions/${_archivefilename}.xpi
}
