pkgname=gale-bin
pkgver=1.11.1
pkgrel=1
pkgdesc="Lightweight Thunderstore client"
arch=('x86_64')
url="https://github.com/Kesomannen/gale"
license=('GPL-3.0-or-later')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'openssl-1.1' 'pango' 'webkit2gtk-4.1' 'xdg-utils')
options=('!strip' '!emptydirs')
source_x86_64=("https://github.com/Kesomannen/gale/releases/download/$pkgver/gale_"$pkgver"_amd64_linux.deb"
    "webkit-disable-compositing.patch"
)
sha256sums_x86_64=('b2f063bd2d8bbdfb55089a3957050a4ca05053676184bb899e6528733ed702f4'
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
