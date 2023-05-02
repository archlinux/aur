# Maintainer: user <user at the google email domain which is .com>

_githubuser=gwenhael-le-moine
_githubrepo=x48ng
_pkgtagname=0.9.10

pkgname=x48ng
pkgver=0.9.10
pkgrel=1
pkgdesc='A reboot of the x48 HP 48 emulator'
arch=('any')
url="https://github.com/${_githubuser}/${_githubrepo}"
license=('GPL2')
depends=('readline' 'libxext' 'xterm')
install="${pkgname}.install"
source=("${_githubrepo}::https://github.com/${_githubuser}/${_githubrepo}/archive/refs/tags/${_pkgtagname}.tar.gz"
        'patch-desktop-file-01')
sha256sums=('aca5b8bd90c9a42f50139a716bfd75d23fa48fdd3e672b164d4014af2ba02956'
            'e18c85ecf9d451e77a6ea764e356182bc6af11c46a91ff28b0d48cb8d8b0c644')

build() {
	cd "${_githubrepo}-${pkgver}"
	patch x48ng.desktop ../patch-desktop-file-01
	make
}

package() {
	cd "${_githubrepo}-${pkgver}"
	make DESTDIR="${pkgdir}/" install
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
