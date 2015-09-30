# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: Chris Brannon <chris@the-brannons.com>
# Contributor: Dag Odenhall <dag.odenhall@gmail.com>

pkgname=rss2email
pkgver=2.71
pkgrel=4
pkgdesc='A tool for delivering news from RSS feeds to your email program'
arch=('any')
url='http://www.allthingsrss.com/rss2email'
license=('GPL')
depends=('python2' 'python2-html2text' 'python2-feedparser')
source=("http://www.allthingsrss.com/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        'r2e.sh')
sha256sums=('d5245197a5034410405f1f5794610b84bf26c0c40c8d05fe0895116797a99b31'
            '9ff592e44705f771f0b75a9268b8239d5c13764c4c500d76f539344610a62f3f')

prepare() {
	# fix permissions
	find ${pkgname}-${pkgver} -type d -print0 | xargs -0 chmod 755
	find ${pkgname}-${pkgver} -type f -print0 | xargs -0 chmod 644

	cd "${pkgname}-${pkgver}"

	sed -i '1c#!/usr/bin/python2' ${pkgname}.py
}

package() {
	cd "${pkgname}-${pkgver}"

	install -D -m0755 ${pkgname}.py "${pkgdir}/usr/lib/${pkgname}/${pkgname}.py"
	install -D -m0644 config.py.example "${pkgdir}/usr/share/${pkgname}/config.py.example"
	install -D -m0644 readme.html "${pkgdir}/usr/share/doc/${pkgname}/readme.html"

	install -D -m0755 "${srcdir}/r2e.sh" "${pkgdir}/usr/bin/r2e"

}

