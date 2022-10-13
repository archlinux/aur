# Maintainer: Castor < whoisyoges at castorisdead dot xyz >

pkgname=onthespot-git
_pkgname=onthespot
pkgver=0.4
pkgrel=1
pkgdesc="A qt based free spotify downloader written in python."
arch=('i686' 'x86_64')
url="https://github.com/casualsnek/onthespot"
license=('GPL2')
depends=('ffmpeg')
makedepends=('git' 'python3' 'bash')
provides=('onthespot')
conflicts=('onthespot-git' 'onthespot')
options=(!strip !emptydirs)
source=("${_pkgname}::git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --tags | sed 's/^v//;s/-/+/g'
}

build() {
	cd "$srcdir/$_pkgname"
	bash build_linux.sh
}

package() {
    cd "${srcdir}/$_pkgname/dist"
	install -Dm755 ./onthespot_linux "${pkgdir}/usr/local/bin/onthespot"
}
