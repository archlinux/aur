# Maintainer: Nate Simon <aurpkg (at natesimon.net)>

pkgname=xplayer
pkgver=2.0.2
pkgrel=2
pkgdesc="Simple media player. X-Apps Project."
arch=('i686' 'x86_64' 'armv7h')
license=('GPL')
depends=('clutter-gtk' 'clutter-gst' 'xplayer-plparser'
    'desktop-file-utils' 'iso-codes' 'yelp-xsl'
    'libpeas' 'gsettings-desktop-schemas' 'dbus-glib'
    'python2-gobject' 'gst-plugins-base' 'gst-plugins-good'
    'xapps')
makedepends=('gnome-common' 'gtk-doc' 'gobject-introspection' 'vala' 'python-xdg')
optdepends=(
    'gst-libav: Extra media codec support'
    'python2-xdg: Subtitle downloader plugin'
)
provides=($pkgname)
conflicts=('xplayer-git')
url='https://github.com/linuxmint/xplayer'

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/linuxmint/${pkgname}/archive/${pkgver}.tar.gz"
        'xplayer_issues_147.patch')
md5sums=('46526042743d6b0af60bbbb7a4388d66'
        '533653d8352f0afcac5c4542f1bc0d84')


prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	patch --strip=1 --input="${srcdir}/xplayer_issues_147.patch"
}


build() {
    cd ${srcdir}/${pkgname}-${pkgver}

    ./autogen.sh ax_is_release="yes" \
        --prefix="/usr" \
        --localstatedir="/var" \
        --libexecdir="/usr/lib/${pkgname}"
    make
}

package(){
    cd ${srcdir}/${pkgname}-${pkgver}
    make DESTDIR="$pkgdir/" install
}

