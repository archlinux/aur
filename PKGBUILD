# Maintainer: goll <adrian.goll+aur[at]gmail>
# Maintainer: Michael Lass <bevan@bi-co.net>

pkgname=sslyze
pkgver=6.0.0
pkgrel=1
pkgdesc="Fast and full-featured SSL scanner."
arch=('i686' 'x86_64')
url='https://github.com/nabla-c0d3/sslyze'
license=('AGPL-3.0-only')
depends=('python')
makedepends=('python-pip')
source=("https://github.com/nabla-c0d3/sslyze/archive/${pkgver}.tar.gz"
        "sslyze")
sha256sums=('408d578ea10e35b66a730da914bb2be6e73ed10bdd7f2101439506efe63ed8df'
            '042db33726a889a64910121f2098e10e6a5ebf4a102a54d09d9a27ed363a8e5d')

package() {
	cd "$srcdir/${pkgname}-${pkgver}"

	# Install files in /opt
	install -dm755 "$pkgdir/opt/sslyze"
	/usr/bin/pip install \
		--target "$pkgdir/opt/sslyze/" \
		--isolated \
		--no-cache-dir \
		--no-warn-conflicts \
		.

	# Create an indirect launcher in /usr/bin
	install -Dm755 "$srcdir/sslyze" "$pkgdir/usr/bin/sslyze"
}
