# Maintainer: LightDot <lightdot -a-t- server.si>
# Contributor: Lars Sjöström <(firstname) @ radicore.se>

pkgname=sapling-scm-bin
_realver=0.2.20260929-102736+288e0c2d
pkgver="${_realver//-/.}" # dashes aren't allowed in pkgver
pkgrel=1
epoch=1
pkgdesc='A user friendly, scalable and Git compatible source control system.'
arch=('x86_64')
license=('GPL2')
url="https://sapling-scm.com/"
depends=(
	'curl'
	'nodejs'
)
optdepends=(
	'git: for using Sapling in Git mode'
	'github-cli: for GitHub interactions'
	'watchman: for faster file watching'
)
provides=('sapling-scm')
conflicts=('sapling-scm' 'sl')
options=('!strip')
source=("https://github.com/facebook/sapling/releases/download/${_realver}/sapling-${_realver}-linux-x64.tar.xz")
sha256sums=('f296b4b7d598dc099d4000e9f2ef656e366b63986db69c8910fe6d85e72d073c')

package() {
	install -Dm755 "lib/python3.12/lib-dynload/"* -t "${pkgdir}/opt/${pkgname}/lib/python3.12/lib-dynload"
	install -m644 "isl-dist.tar.xz" "${pkgdir}/opt/${pkgname}"
	install -m755 "sl" "${pkgdir}/opt/${pkgname}"

	install -d "$pkgdir/usr/bin"
	ln -s "/opt/${pkgname}/sl" "$pkgdir/usr/bin"
}
