# submit: Chao Wang <chaowang@redhat.com>

pkgname=koji
pkgver=1.9.0
pkgrel=1
pkgdesc='Koji is a system for building and tracking RPMS. This base package contains shared libraries and the command-line interface.'
arch=('any')
license=('GPL2' 'LGPL2.1')
url=('https://fedorahosted.org/koji/')
depends=('python2-krbv' 'python2-pyopenssl' 'urlgrabber' 'rpm-org')
makedepends=('python2')
source=("https://fedorahosted.org/released/${pkgname}/${pkgname}-${pkgver}.tar.bz2"
        "makefile_python_to_python2.patch")
sha256sums=('ec933af8359408b11478477de83b042a5bdf1d23e85683528aebb53c9bc0e6bc'
            'f1bc4f65f4f7be2615336ce0e5d2fd728f6af2b6cd12f4d40ee59d204fa5ca9c')

prepare() {
	cd "$pkgname-$pkgver"
	patch -p1 -i "$srcdir/makefile_python_to_python2.patch"
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" -C koji install
}
