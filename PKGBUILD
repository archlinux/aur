pkgname=gale-bin
pkgver=1.12.0
pkgrel=1
pkgdesc="Lightweight Thunderstore client"
arch=('x86_64')
url="https://github.com/Kesomannen/gale"
license=('GPL-3.0-or-later')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'openssl' 'pango' 'webkit2gtk-4.1' 'xdg-utils')
options=('!strip' '!emptydirs')
source_x86_64=("https://github.com/Kesomannen/gale/releases/download/$pkgver/gale_"$pkgver"_amd64.deb"
    "webkit-disable-compositing.patch"
)
sha256sums_x86_64=('6b759cebf304dd2f3b963a23cf65d2b3494eecb8d7e66856b5610fd02cb130aa'
    SKIP
)

package() {
    # extract package data
    tar xf data.tar.gz -C "${pkgdir}"

    patch -d "${pkgdir}" -Np2 -i "${srcdir}/webkit-disable-compositing.patch"
}

post_install() {
    gtk-update-icon-cache -q -t -f usr/share/icons/hicolor
    update-desktop-database -q
}

post_upgrade() {
    post_install
}

post_remove() {
    gtk-update-icon-cache -q -t -f usr/share/icons/hicolor
	update-desktop-database -q
}
