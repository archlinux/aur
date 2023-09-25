# Maintainer: grufo <madmurphy333 AT gmail DOT com>
# Contributor: tleydxdy <shironeko(at)waifu(dot)club>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: wahnby <wahnby@yahoo.fr>

pkgname='gnunet-gtk'
pkgver='0.20.0'
pkgrel=1
pkgdesc='A frontend for GNUnet'
arch=('x86_64')
url='https://gnunet.org'
license=('GPL')
depends=('gnunet' 'glade')
optdepends=('qrencode')
source=("https://ftp.gnu.org/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
        'gnunet-peerinfo-gtk.desktop'
        'gnunet-peerinfo-gtk.svg'
        'gnunet-statistics-gtk.desktop'
        'gnunet-statistics-gtk.svg')
sha256sums=('e991e50c82ab4e6aff691cf893916d455c59ec1f47961db0e36413e1846c562d'
            'ff025def7fd3383cf9ba0809926802d2476ef73ccbc91b6ad317554987ade4d7'
            '43e743bcf971c53ab4be0955d29b1915624a34f95785df1bf47a3fa45e6a8039'
            'e82947317b62c86de52065bc7c5e4a3899a587aedcaa039effda3dd8da23d79b'
            '736d5e7d6aaaefad889ee2aa3ca7adc4ffefd4130e3b55380aa1267888606618')

build() {

	cd "${srcdir}/${pkgname}-${pkgver}"

	./configure --prefix=/usr --with-gnunet=/usr
	make

}

package() {

	cd "${srcdir}/${pkgname}-${pkgver}"

	make DESTDIR="${pkgdir}" install

	install -dm755 "${pkgdir}/usr/share/applications"

	install -Dm644 "${srcdir}/gnunet-peerinfo-gtk.desktop" \
		"${pkgdir}/usr/share/applications/gnunet-peerinfo-gtk.desktop"

	install -Dm644 "${srcdir}/gnunet-statistics-gtk.desktop" \
		"${pkgdir}/usr/share/applications/gnunet-statistics-gtk.desktop"

	install -dm755 "${pkgdir}/usr/share/icons/hicolor/scalable/apps"

	install -Dm 644 "${srcdir}/gnunet-peerinfo-gtk.svg" \
		"${pkgdir}/usr/share/icons/hicolor/scalable/apps/gnunet-peerinfo-gtk.svg"

	install -Dm 644 "${srcdir}/gnunet-statistics-gtk.svg" \
		"${pkgdir}/usr/share/icons/hicolor/scalable/apps/gnunet-statistics-gtk.svg"

}
