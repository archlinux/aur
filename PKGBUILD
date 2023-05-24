# Maintainer: Lars Sjöström <(firstname) @ radicore.se>

pkgname=sapling-scm-bin
_realver=0.2.20230523-092610+f12b7eee
pkgver="${_realver//-/.}" # dashes aren't allowed in pkgver
pkgrel=1
epoch=1
pkgdesc='Sapling SCM is a cross-platform, highly scalable, Git-compatible source control system.'
arch=('x86_64')
license=('GPL2')
url='https://sapling-scm.com/'
depends=('curl' 'nodejs' 'python310' 'github-cli')
optdepends=('watchman: for faster file watching')
provides=('sapling-scm')
conflicts=('sapling-scm')

options=('!strip')

source=("https://github.com/facebook/sapling/releases/download/$_realver/sapling_${_realver}_amd64.Ubuntu22.04.deb")
sha256sums=('916ad6c7088a7cb47a3d511ea669140d6305d882ddefd95320c0e38e5c1cbeb0')

package() {
	cd "${srcdir}"
	tar --use-compress-program=unzstd -xvf data.tar.zst --no-same-owner -C "${pkgdir}"
	# Fix permissions
	chmod -R go-w "${pkgdir}"
}
