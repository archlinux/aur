# Maintainer: Peter Mattern <pmattern at arcor dot de>

pkgname=thunderbird-extension-cardbook
pkgver=107.2
_commit=8cb0683622cb21bd3db30d3064794e6fbb16f889
pkgrel=1
pkgdesc="A new Thunderbird address book based on the CardDAV and vCard standards"
arch=('any')
url='https://gitlab.com/cardbook/cardbook'
license=('MPL-2.0')
depends=('thunderbird')
conflicts=('thunderbird<128' 'thunderbird>=161')
source=("${url}/-/archive/${_commit}/${pkgname#thunderbird-extension-}-${pkgver}.tar.gz")
sha256sums=('554dec43eacd1c713a307488678c3bbf96a8e488d01bd311402dd961dec4f559')

build() {
    cd CardBook-${_commit}
    export _archivefilename=$(grep '"id"' manifest.json | awk -F \" '{print $4}')
    bsdtar -caf "${srcdir}"/${_archivefilename}.zip chrome _locales background.html background.js LICENSE manifest.json policy.md README.md VENDOR.md
}

package() {
    install -D -m644 ${_archivefilename}.zip "${pkgdir}"/usr/lib/thunderbird/extensions/${_archivefilename}.xpi
}
