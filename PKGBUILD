# Maintainer: Agil Mammadov <mammadovagil@tutamail.com>

pkgname=nazar-blocker-git
pkgver=r7.43bcc0c
pkgrel=1
pkgdesc="Protect your computer from nazar (evil eye) — Qt6 system tray app"
arch=('x86_64' 'aarch64')
url="https://github.com/sulincix-other/nazar-blocker"
license=('LicenseRef-IOSL')
depends=('qt6-base' 'hicolor-icon-theme')
makedepends=('qt6-tools' 'git')
provides=('nazar-blocker')
conflicts=('nazar-blocker')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$pkgname"
    qmake6 nazar.pro
    make
}

package() {
    cd "$pkgname"

    install -Dm755 nazar "$pkgdir/usr/bin/nazar-blocker"
    install -Dm644 src/nazar.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/nazar-blocker.svg"
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/nazar-blocker.desktop" <<EOF
[Desktop Entry]
Name=Nazar Blocker
Comment=Protect your computer from nazar (evil eye)
Exec=nazar-blocker
Icon=nazar-blocker
Type=Application
Categories=Utility;
StartupNotify=false
EOF
}
