# Maintainer: Bruno Miguel <bruno@privacyrequired.com>

pkgname=thunderbird-extension-send-later-git
pkgver=10.3.6.948cf1b1
pkgrel=1
pkgdesc=" Schedule messages to be sent at a specific time"
arch=('any')
url='https://github.com/Extended-Thunder/send-later'
license=('MPL2')
depends=('thunderbird')
source=("git+${url}")
md5sums=('SKIP')

pkgver() {
	cd send-later
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)//;s/-/./g'
}

build() {
    cd "${srcdir}/send-later"
    export _archivefilename=$(grep id manifest.json | awk -F \" '{print $4}')
    bsdtar -caf ${srcdir}/$_archivefilename.zip *
}

package() {
    install -D -m644 $_archivefilename.zip ${pkgdir}/usr/lib/thunderbird/extensions/$_archivefilename.xpi
}
 
