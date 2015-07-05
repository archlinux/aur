# Maintainer: goll <adrian.goll+aur[at]gmail>

pkgname='sslyze'
pkgver=0.11
pkgrel=1
pkgdesc="Fast and full-featured SSL scanner."
arch=('i686' 'x86_64')
url=('https://github.com/nabla-c0d3/sslyze')
license=('GPL2')
depends=('python2')
source_i686=("https://github.com/nabla-c0d3/sslyze/releases/download/release-${pkgver}/${pkgname}-${pkgver/./_}-linux32.zip")
source_x86_64=("https://github.com/nabla-c0d3/sslyze/releases/download/release-${pkgver}/${pkgname}-${pkgver/./_}-linux64.zip")
sha1sums_i686=('9c62315fcee0aaa2a9ba68bd6bd7ea8e276af23f')
sha1sums_x86_64=('45c6fe9eb53d6226e117a92d437fd2f31fbfe705')

prepare() {
	find $srcdir/*/$pkgname/ -type d -exec chmod 755 {} +
}

package() {
	# Install files in /opt
	mkdir -p "$pkgdir/opt/sslyze"
	cp -a $srcdir/*/${pkgname}/. $pkgdir/opt/sslyze
	find $pkgdir/opt/sslyze -type f -name '*.py' -print0 | xargs -0 sed -i 's/python/python2/'

	# Create an indirect launcher in /usr/bin
	mkdir -p "$pkgdir/usr/bin"

cat << EOF > "$pkgdir/usr/bin/sslyze"
#!/usr/bin/bash
cd /opt/sslyze && python2 sslyze.py \$@
EOF

	chmod 755 "$pkgdir/usr/bin/sslyze"
}
