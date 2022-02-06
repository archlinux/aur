# Maintainer: Elrondo46 TuxnVape <elrond94@hotmail.com>

pkgname=mate-fastcomposwitch-git
pkgver=20200406
pkgrel=10
pkgdesc="Compositor or not with a simple systray icon"
arch=(x86_64)
license=('GPL')
url="https://github.com/Elrondo46/mate-fastcomposwitch/"
depends=('python-gobject' 'mate-desktop' 'libappindicator-gtk3' 'python-notify2' 'gettext')
makedepends=('git')
source=(git://github.com/Elrondo46/mate-fastcomposwitch.git)
md5sums=('SKIP')

pkgver() {
    # Identify latest version.
    cd "$srcdir/mate-fastcomposwitch"
    git log -1 --format="%cd" --date=short | sed 's|-||g'
}

build() {
        _src="${srcdir}/mate-fastcomposwitch"
    find ${_src}/locales -name \*.po -execdir msgfmt marcosystray.po -o marcosystray.mo \;
}

package() {
        install -Dm644 "mate-fastcomposwitch/marcosystray.desktop" "${pkgdir}/usr/share/applications/marcosystray.desktop"
        install -Dm755 "mate-fastcomposwitch/marcosystray" "${pkgdir}/usr/bin/marcosystray"
        install -Dm644 "mate-fastcomposwitch/icons/mate-fast-composwitch-active.png" "${pkgdir}/usr/share/icons/mate-fast-composwitch-active.png"
        install -Dm644 "mate-fastcomposwitch/icons/mate-fast-composwitch-inactive.png" "${pkgdir}/usr/share/icons/mate-fast-composwitch-inactive.png"
        install -Dm644 "mate-fastcomposwitch/locales/fr/LC_MESSAGES/marcosystray.mo" "${pkgdir}/usr/share/locale/fr/LC_MESSAGES/marcosystray.mo"
}
