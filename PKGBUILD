# Maintainer: goll <adrian.goll+aur[at]gmail>

pkgname='sslyze'
pkgver=0.14.0
pkgrel=1
pkgdesc="Fast and full-featured SSL scanner."
arch=('i686' 'x86_64')
url='https://github.com/nabla-c0d3/sslyze'
license=('GPL2')
depends=('python2' 'python2-pip')
source=("https://github.com/nabla-c0d3/sslyze/archive/${pkgver}.tar.gz")
sha1sums=('4307e16a25e5eb5fa59b16fc82ef255bb533321f')

package() {
	# Install files in /opt
	mkdir -p "$pkgdir/opt/sslyze"
	cp -a $srcdir/${pkgname}-${pkgver}/. $pkgdir/opt/sslyze
	pip2 install -r $pkgdir/opt/sslyze/requirements.txt --target $pkgdir/opt/sslyze/lib

	# Create an indirect launcher in /usr/bin
	mkdir -p "$pkgdir/usr/bin"

cat << EOF > "$pkgdir/usr/bin/sslyze"
#!/usr/bin/bash
python2 /opt/sslyze/sslyze_cli.py \$@
EOF
	chmod 755 "$pkgdir/usr/bin/sslyze"

}
