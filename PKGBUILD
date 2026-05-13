# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>

pkgname=proton-authenticator-bin
_name=${pkgname%-bin}
pkgver=1.1.5
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
sha512sums_x86_64=('99de0004e9036c80f8565a1689266744030ed4790dc0cec9b04328c28b9114d08436ce49d41d80e18811943014a430fb93acb1fd9975471a0038587b246fe2fb')
b2sums_x86_64=('54714daf7795657917a054d284db1920bc62c0023a7689d8f1672d03d99563252a65ef083f9c60f07b3c51aab3f32809213bd98d8e3b4067857a9cf6114e3a06')

prepare() {
    tar -xf data.tar.gz

    # Fix display issue on Wayland+Nvidia and X11
    sed -i 's/Exec=proton-authenticator/Exec=env WEBKIT_DISABLE_DMABUF_RENDERER=1 proton-authenticator/' \
        "usr/share/applications/Proton Authenticator.desktop"
}

package() {
    cp -r usr "$pkgdir/"
}
