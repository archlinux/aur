# Maintainer: Omid Mottaghi Rad <omidmr at gmail dot com>
# Co-Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=gnome-shell-extension-persian-calendar-git
pkgver=r318.6ba3922
pkgrel=1
pkgdesc="An extension for Gnome-Shell to show Persian date and calendar."
arch=(any)
url="https://github.com/omid/Persian-Calendar-for-Gnome-Shell"
license=(GPL3)
depends=('gnome-shell>=40')
makedepends=('git')
optdepends=('vazirmatn-fonts: to use as default Persian font.')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install="${pkgname%-git}.install"
source=("${pkgname%-git}::git+${url}")
sha256sums=('SKIP')

prepare() {
    cd "$srcdir/${pkgname%-git}"
    sed -i 's|\binstall_fonts();||g' 'PersianCalendar@oxygenws.com/extension.js'
    sed -i 's|\buninstall_fonts();||g' 'PersianCalendar@oxygenws.com/extension.js'
    sed -i 's|Vazir,|Vazirmatn,|g' 'PersianCalendar@oxygenws.com/stylesheet.css'
}

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/${pkgname%-git}"
    make DESTDIR="${pkgdir}" install-local
}
# vim:set ts=4 sw=4 et:
