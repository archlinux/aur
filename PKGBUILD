# Maintainer: Lars Sjöström <(firstname) @ radicore.se>

pkgname=sapling-scm-bin
_realver=0.2.20230124-180750-hf8cd450a
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
sha256sums=('6d20686c4fa713ae861ab84728a162c6f750c8fe149d2c8a717601df0ed163ab')

package() {
	cd "${srcdir}"
	tar --use-compress-program=unzstd -xvf data.tar.zst --no-same-owner -C "${pkgdir}"
	# Fix permissions
	chmod -R go-w "${pkgdir}"
}
