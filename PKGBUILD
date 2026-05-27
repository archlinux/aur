# Maintainer: LightDot <lightdot -a-t- server.si>
# Contributor: Lars Sjöström <(firstname) @ radicore.se>

pkgname=sapling-scm-bin
_realver=0.2.20260522-084851+1e764c94
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
conflicts=('sapling-scm' 'sl')
options=('!strip')
source=("https://github.com/facebook/sapling/releases/download/${_realver}/sapling-${_realver}-linux-x64.tar.xz")
sha256sums=('72552ab655c0c8cd315b93ac9fc902de7281ce57eb5e39da97939c34b93480bc')

package() {
	install -Dm755 "lib/python3.12/lib-dynload/"* -t "${pkgdir}/opt/${pkgname}/lib/python3.12/lib-dynload"
	install -m644 "isl-dist.tar.xz" "${pkgdir}/opt/${pkgname}"
	install -m755 "sl" "${pkgdir}/opt/${pkgname}"

	install -d "$pkgdir/usr/bin"
	ln -s "/opt/${pkgname}/sl" "$pkgdir/usr/bin"
}
