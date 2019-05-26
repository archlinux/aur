# Maintainer: robertfoster
# Contributor: kehon

pkgname=traccar-bin
pkgver=4.5
pkgrel=1
pkgdesc="Open source GPS tracking system"
arch=('i686' 'x86_64')
url="http://www.traccar.org/"
license=('APACHE')
depends=(java-runtime)
source=("https://github.com/tananaev/traccar/releases/download/v${pkgver}/${pkgname%%-*}-linux-64-$pkgver.zip"
"${pkgname%%-*}.service")

package() {
	cd ${srcdir}
	./traccar.run --noexec --target $pkgdir/opt/traccar/
	install -m755 -d "${pkgdir}/usr/lib/systemd/system"
	install -m644 "${srcdir}/traccar.service" "${pkgdir}/usr/lib/systemd/system/"
	install -m755 -d "${pkgdir}/opt/traccar/init.d"
	chmod 755 -R $pkgdir/opt/*
}

md5sums=('b1ed400e3ee0ba060d7c3452b28b68a3'
'3e230b1b98fb5d0ae71ee08ab96a7c92')
