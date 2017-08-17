# Maintainer: s3rj1k <evasive dot gyron at gmail dot com>

pkgname=firefox-eme-free-ru-bin
_pkgname=${pkgname/-bin/}
pkgver=55.0.2
pkgrel=1
pkgdesc='Standalone web browser from mozilla.org - EME free release (RU)'
url='http://www.mozilla.org/en-US/firefox/organizations/'
arch=('x86_64')
depends=('gtk3' 'dbus-glib' 'desktop-file-utils' 'libxt' 'mime-types' 'nss' 'shared-mime-info' 'gconf')
optdepends=('libgnome: fixes file association/default browser issues on GNOME desktops.'
			'gstreamer0.10: HTML5 video'
			'gstreamer0.10-good-plugins: h.264 video'
			)
provides=('firefox')
license=('MPL' 'GPL' 'LGPL')
install=$_pkgname.install
sha512sums=(
 '0b9a6f68375a584eba9ebffe4c72d6affdd4ea972a028261f12f4f3ef74ff77d62c88faaf704ab2d9b6476a60a494a7c8166e5b3f4132765c9401bc48049cab0'
 'b20dc825c4a0fe6a14481f0309d74a43124d28d96519ed7b83a44ba3656c3a7cbe09d6ea89e8ca941f72db58e580aaa29aeb12b9c285bffde1ff73a46396227f'
)
source=(http://ftp.mozilla.org/pub/mozilla.org/firefox/releases/${pkgver}/linux-x86_64-EME-free/ru/firefox-${pkgver}.tar.bz2
        $_pkgname.desktop)

package() {
    cd "$srcdir"

    install -d "$pkgdir/{usr/{bin,share/{applications,pixmaps}},opt}"
    cp -r firefox/ "$pkgdir/opt/$_pkgname"

    ln -s /opt/$_pkgname/firefox "$pkgdir/usr/bin/$_pkgname"
    install -m644 "$srcdir/$_pkgname.desktop" "$pkgdir/usr/share/applications/"
    install -m644 "$srcdir/firefox/browser/icons/mozicon128.png" "$pkgdir/usr/share/pixmaps/$_pkgname.png"
}
