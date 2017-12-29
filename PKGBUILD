# Maintainer: goll <adrian.goll+aur[at]gmail>
# Maintauber: Michael Lass <bevan@bi-co.net>

pkgname='sslyze'
pkgver=1.3.2
pkgrel=1
pkgdesc="Fast and full-featured SSL scanner."
arch=('i686' 'x86_64')
url='https://github.com/nabla-c0d3/sslyze'
license=('AGPL3')
depends=('python')
makedepends=('python-pip')
options=('!strip')
source=("https://github.com/nabla-c0d3/sslyze/archive/${pkgver}.tar.gz")
sha1sums=('08d01fff650e34e0c62f18311ad962ebcdb4530f')

package() {
	# Install files in /opt
	mkdir -p "$pkgdir/opt/sslyze"
	cp -a $srcdir/${pkgname}-${pkgver}/. $pkgdir/opt/sslyze
	pip install -r $pkgdir/opt/sslyze/requirements.txt --target $pkgdir/opt/sslyze/lib

	# Create an indirect launcher in /usr/bin
	mkdir -p "$pkgdir/usr/bin"

cat << EOF > "$pkgdir/usr/bin/sslyze"
#!/usr/bin/bash
export PYTHONPATH="/opt/sslyze"
python -m sslyze \$@
EOF
	chmod 755 "$pkgdir/usr/bin/sslyze"

}
