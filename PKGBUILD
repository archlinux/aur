# Maintainer: Peter Mattern <pmattern at arcor dot de>

pkgname=thunderbird-extension-cardbook
pkgver=120.0
_commit=8133d3e0d222991995f2b072435d2b2ffd24ad09
pkgrel=1
pkgdesc="A new Thunderbird address book based on the CardDAV and vCard standards"
arch=('any')
url='https://gitlab.com/cardbook/cardbook'
license=('MPL-2.0')
depends=('thunderbird')
conflicts=('thunderbird<128' 'thunderbird>=163')
source=("${url}/-/archive/${_commit}/${pkgname#thunderbird-extension-}-${pkgver}.tar.gz")
sha256sums=('7611fe3286f8107a76e5fd1e478abe6e6d4b33c3abf6743cfe2555f2b3b96659')

build() {
    cd CardBook-${_commit}
    export _archivefilename=$(grep '"id"' manifest.json | awk -F \" '{print $4}')
    bsdtar -caf "${srcdir}"/${_archivefilename}.zip chrome _locales background.html background.js LICENSE manifest.json policy.md README.md VENDOR.md
}

package() {
    install -D -m644 ${_archivefilename}.zip "${pkgdir}"/usr/lib/thunderbird/extensions/${_archivefilename}.xpi
}
