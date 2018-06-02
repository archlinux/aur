# Maintainer: goll <adrian.goll+aur[at]gmail>
# Maintauber: Michael Lass <bevan@bi-co.net>

pkgname=sslyze
pkgver=1.4.2
pkgrel=1
pkgdesc="Fast and full-featured SSL scanner."
arch=('i686' 'x86_64')
url='https://github.com/nabla-c0d3/sslyze'
license=('AGPL3')
depends=('python')
makedepends=('python-pip')
options=('!strip')
source=("https://github.com/nabla-c0d3/sslyze/archive/${pkgver}.tar.gz"
        "sslyze")
sha256sums=('5dfa5e3e2dc5b6b57c50370dcb234c6625fba64e4b10c8de197df90dd9cbb838'
            '8d2ffc47d608ce439b683500c9dde94b953535b499ef72dfcd548f45faa71fb2')

package() {
	# Install files in /opt
	mkdir -p "$pkgdir/opt/sslyze"
	cp -a $srcdir/${pkgname}-${pkgver}/. $pkgdir/opt/sslyze
	pip install -r $pkgdir/opt/sslyze/requirements.txt --target $pkgdir/opt/sslyze/lib

	# Create an indirect launcher in /usr/bin
	mkdir -p "$pkgdir/usr/bin"
	install -Dm 755 "$srcdir/sslyze" "$pkgdir/usr/bin/sslyze"
}
