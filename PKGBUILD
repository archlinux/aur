# Maintainer: MatMoul <matmoul at the google email domain which is .com>

_githubuser=gwenhael-le-moine
_githubrepo=x48ng
_gitcommit=1bdffaf18c8279089ff50a67ed09252263dc7c73

pkgname=x48ng-git
pkgver=0.9.10.r1.1bdffaf
pkgrel=1
pkgdesc='A reboot of the x48 HP 48 emulator'
arch=('any')
url="https://github.com/${_githubuser}/${_githubrepo}"
license=('GPL2')
depends=('readline' 'libxext' 'xterm')
makedepends=('git')
install="${pkgname}.install"
provides=('x48' 'checkrom' 'dump2rom' 'mkcard')
source=("git+https://github.com/${_githubuser}/${_githubrepo}.git#commit=${_gitcommit}"
        'patch-desktop-file-01')
sha256sums=('SKIP'
            'e18c85ecf9d451e77a6ea764e356182bc6af11c46a91ff28b0d48cb8d8b0c644')

build() {
	cd "${_githubrepo}"
        patch x48ng.desktop ../patch-desktop-file-01
	make
}

package() {
	cd "${_githubrepo}"
	make DESTDIR="${pkgdir}/" install
        install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/x48ng/LICENSE"
}
