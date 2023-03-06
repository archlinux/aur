# Maintainer: Lars Sjöström <(firstname) @ radicore.se>

pkgname=sapling-scm-bin
_realver=0.2.20230228-144002-h9440b05e
pkgver="${_realver//-/.}" # dashes aren't allowed in pkgver
pkgrel=2
epoch=1
pkgdesc='Sapling SCM is a cross-platform, highly scalable, Git-compatible source control system.'
arch=('x86_64')
license=('GPL2')
url='https://sapling-scm.com/'
depends=('curl' 'nodejs' 'python' 'github-cli')
optdepends=('watchman: for faster file watching')
provides=('sapling-scm')
conflicts=('sapling-scm')

options=('!strip')

source=("https://github.com/facebook/sapling/releases/download/$_realver/sapling_${_realver}_amd64.Ubuntu22.04.deb")
sha256sums=('9841f572b99f9e92df6b511957978b1395164be2622334b218ce92de90f738a9')

package() {
	cd "${srcdir}"
	tar --use-compress-program=unzstd -xvf data.tar.zst --no-same-owner -C "${pkgdir}"
	# Fix permissions
	chmod -R go-w "${pkgdir}"
}
