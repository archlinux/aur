# Maintainer: KUHTOXO https://aur.archlinux.org/account/kuhtoxo

pkgname=max-bin
pkgver=26.38.0.82021
pkgrel=1

pkgdesc="MAX messenger."
arch=("x86_64")
url='https://max.ru'
license=("custom:max")
categories=("network")

depends=(
         "ca-certificates"
         "glib2"
         "libxcb"
         "libxinerama"
         "libxcomposite"
         "libxss"
         "xcb-util-wm"
         "xcb-util-cursor"
         "xcb-util-keysyms"
         "libxkbcommon"
         "libva"
         "libxaw"
         "libvdpau"
         "libnotify"
         "gsettings-desktop-schemas"
         "libxres"
         "libglvnd"
        )
optdepends=('gnome-keyring: Fixses startup in Gmome. Store passwords and encryption keys.' 'hicolor-icon-theme')
options=('!strip' '!debug')

_app_name="MAX"
_filename="${_app_name}-${pkgver}.rpm"

provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")

source_x86_64=("https://download.max.ru/linux/rpm/el/9/${arch}/${_filename}")

sha256sums_x86_64=('3a2caba0cc47682f8b9708406323eab7d9ed54a2061abeeb8f63b00ed30b4e5a')

package() {
    cp -a "${srcdir}/usr/"  "${pkgdir}/usr/"
    mkdir -p "${pkgdir}/usr/bin/"
    ln -sf "/usr/share/max/bin/max" "${pkgdir}/usr/bin/max"
    #Temporary fix for the app to work with calls (rename the libraries that come with the app so that the system ones are used instead).
    mv "${pkgdir}/usr/share/max/bin/max-service/lib64/libsystemd.so.0" "${pkgdir}/usr/share/max/bin/max-service/lib64/libsystemd.so.0.bak"
    mv "${pkgdir}/usr/share/max/bin/max-service/lib64/libpcre2-8.so.0" "${pkgdir}/usr/share/max/bin/max-service/lib64/libpcre2-8.so.0.bak"
}
