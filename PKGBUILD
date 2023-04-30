# Maintainer: Lars Sjöström <(firstname) @ radicore.se>

pkgname=sapling-scm-bin
_realver=0.2.20230426-145232+7ea1f245
pkgver="${_realver//-/.}" # dashes aren't allowed in pkgver
pkgrel=1
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
sha256sums=('fc1ba825b5e7e58ba8a664f9a57b5856234895075fddae78fe87f9cb63ceca84')

package() {
	cd "${srcdir}"
	tar --use-compress-program=unzstd -xvf data.tar.zst --no-same-owner -C "${pkgdir}"
	# Fix permissions
	chmod -R go-w "${pkgdir}"
}
