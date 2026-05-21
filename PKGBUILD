# Maintainer: LightDot <lightdot -a-t- server.si>
# Contributor: Lars Sjöström <(firstname) @ radicore.se>

pkgname=sapling-scm-bin
_realver=0.2.20260519-201124+961b43fa
pkgver="${_realver//-/.}" # dashes aren't allowed in pkgver
pkgrel=1
epoch=1
pkgdesc='A user friendly, scalable and Git compatible source control system.'
arch=('x86_64')
license=('GPL2')
url='https://sapling-scm.com/'
depends=('curl' 'nodejs')
optdepends=(
	'git: for using Sapling in Git mode'
	'github-cli: for GitHub interactions'
	'watchman: for faster file watching'
)
provides=('sapling-scm')
conflicts=('sapling-scm')
options=('!strip')
source=("https://github.com/facebook/sapling/releases/download/${_realver}/sapling-${_realver}-linux-x64.tar.xz")
sha256sums=('3c7ac19203a7334a9547d8f8cec193dc2c2c998df7702d4ddfde1d00ab741cf0')

package() {
	install -Dm755 "lib/python3.12/lib-dynload/"* -t "${pkgdir}/opt/${pkgname}/lib/python3.12/lib-dynload"
	install -m644 "isl-dist.tar.xz" "${pkgdir}/opt/${pkgname}"
	install -m755 "sl" "${pkgdir}/opt/${pkgname}"

	install -d "$pkgdir/usr/bin"
	ln -s "/opt/${pkgname}/sl" "$pkgdir/usr/bin"
}
