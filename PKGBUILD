# Maintainer: Bruno Miguel <bruno@privacyrequired.com>

pkgname=thunderbird-extension-xnote-git
pkgver=4.0.1.8bb777c
pkgrel=1
pkgdesc="Persistent sticky notes for Thunderbird associated to mails. You can email them/print/copy to clipboard."
arch=('any')
url='https://github.com/xnotepp/xnote'
license=('GPL2')
depends=('thunderbird')
source=("git+${url}")
md5sums=('SKIP')

pkgver() {
	cd xnote
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)//;s/-/./g'
}

build() {
    cd "${srcdir}/xnote/src"
    export _archivefilename=$(grep id manifest.json | awk -F \" '{print $4}')
    bsdtar -caf ${srcdir}/$_archivefilename.zip *
}

package() {
    install -D -m644 $_archivefilename.zip ${pkgdir}/usr/lib/thunderbird/extensions/$_archivefilename.xpi
}
 
