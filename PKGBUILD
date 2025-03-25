# Maintainer: grufo <madmurphy333 AT gmail DOT com>
# Contributor: tleydxdy <shironeko(at)waifu(dot)club>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: wahnby <wahnby@yahoo.fr>

pkgname='gnunet-gtk'
pkgver='0.24.0'
pkgrel=1
pkgdesc='A frontend for GNUnet'
arch=('x86_64')
url='https://gnunet.org'
license=('GPL')
depends=('gnunet' 'glade')
optdepends=('qrencode')
source=("https://ftp.gnu.org/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
        'gnunet-conversation-gtk.desktop'
        'gnunet-conversation-gtk.svg'
        'gnunet-statistics-gtk.desktop'
        'gnunet-statistics-gtk.svg')
sha256sums=('aec43332f3a8404baeb217748c1190b7d8facd78f61b548c6b1f1de10a0357ab'
            'c0b56852194cf98f3e37e7b1dc09261c5b05781733624cdc7fa8aea5d36ebb89'
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

	install -Dm644 "${srcdir}/gnunet-conversation-gtk.desktop" \
		"${pkgdir}/usr/share/applications/gnunet-conversation-gtk.desktop"

	install -Dm644 "${srcdir}/gnunet-statistics-gtk.desktop" \
		"${pkgdir}/usr/share/applications/gnunet-statistics-gtk.desktop"

	install -dm755 "${pkgdir}/usr/share/icons/hicolor/scalable/apps"

	install -Dm 644 "${srcdir}/gnunet-conversation-gtk.svg" \
		"${pkgdir}/usr/share/icons/hicolor/scalable/apps/gnunet-conversation-gtk.svg"

	install -Dm 644 "${srcdir}/gnunet-statistics-gtk.svg" \
		"${pkgdir}/usr/share/icons/hicolor/scalable/apps/gnunet-statistics-gtk.svg"

}
