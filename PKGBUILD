# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>

pkgname=proton-authenticator-bin
_name=${pkgname%-bin}
pkgver=1.1.6
pkgrel=1
pkgdesc='2FA app from Proton to securely sync and backup 2FA codes'
arch=(x86_64)
url='https://proton.me/authenticator'
license=(GPL-3.0-or-later)
depends=(cairo
         dbus
         gdk-pixbuf2
         glib2
         glibc
         gtk3
         hicolor-icon-theme
         libgcc
         libsoup3
         pango
         webkit2gtk-4.1)
provides=($_name)
conflicts=($_name)
source_x86_64=(https://proton.me/download/authenticator/linux/ProtonAuthenticator_${pkgver}_amd64.deb)
sha512sums_x86_64=('b438e6cc14a7c7fd22decd8e7bd00b11e2c3b5f490e8a3a751f3c8d9a2952604a974a50eda8f119aace88596266c6b446d72dfd3b840ee565d52fee7fe57d6d0')
b2sums_x86_64=('823145b37b9c09d63a18811693efaf7f34bc837b3795ba1a3b74099f481e9aadcfd289286b5b9b9b9b26b05610c694c4b291d51aafb24fcadf36b7338af8956b')

prepare() {
    tar -xf data.tar.gz

    # Fix display issue on Wayland+Nvidia and X11
    sed -i 's/Exec=proton-authenticator/Exec=env WEBKIT_DISABLE_DMABUF_RENDERER=1 proton-authenticator/' \
        "usr/share/applications/Proton Authenticator.desktop"
}

package() {
    cp -r usr "$pkgdir/"
}
