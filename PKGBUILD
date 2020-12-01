pkgname=cinnamon-slim
pkgver=4.8.0
pkgrel=2
pkgdesc="Linux desktop which provides advanced innovative features and a traditional user experience"
arch=('x86_64')
url="https://github.com/linuxmint/${pkgname%-slim}"
license=('GPL2')
provides=("cinnamon=$pkgver")
conflicts=('cinnamon')
replaces=('cinnamon')
depends=('accountsservice' 'caribou' 'cinnamon-control-center' 'cinnamon-menus' 'cinnamon-screensaver'
         'cinnamon-session' 'cinnamon-settings-daemon' 'cjs' 'gnome-backgrounds'
         'gnome-themes-extra' 'gstreamer' 'libcroco' 'libgnomekbd' 'libkeybinder3' 'librsvg' 'muffin'
         'nemo' 'polkit-gnome' 'python-cairo' 'python-dbus'
         'python-gobject' 'python-pam' 'python-pexpect' 'python-pillow' 'python-pyinotify'
         'python-pytz' 'python-tinycss2' 'python-xapp' 'timezonemap' 'xapps')
optdepends=('blueberry: Bluetooth support'
            'cinnamon-translations: i18n'
            'gnome-panel: fallback mode'
            'metacity: fallback mode'
            'system-config-printer: printer settings')
makedepends=()
options=('!emptydirs')
source=("https://archive.archlinux.org/packages/c/cinnamon/cinnamon-$pkgver-1-x86_64.pkg.tar.zst")
sha512sums=('SKIP')

package() {
    cp -R "${srcdir}/etc" "${pkgdir}/etc"
    cp -R "${srcdir}/usr" "${pkgdir}/usr"
    sed --in-place 's/nm-applet;//g' "${pkgdir}/usr/share/cinnamon-session/sessions/cinnamon.session"
    sed --in-place 's/nm-applet;//g' "${pkgdir}/usr/share/cinnamon-session/sessions/cinnamon2d.session"
    sed --in-place '/nm-applet/d' "${pkgdir}/usr/share/cinnamon/js/ui/statusIconDispatcher.js"
    rm -rf "${pkgdir}/usr/share/cinnamon/applets/network@cinnamon.org"
}

