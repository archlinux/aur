# Maintainer: Filip Markovic <f12markovic at gmail dot com>
_pkgname="hyprevents"
pkgname="$_pkgname-git"
pkgver=r0.0000000
pkgrel=1
pkgdesc="Invoke shell functions in response to Hyprland socket2 events."
arch=(x86_64 aarch64)
url="https://github.com/vilari-mickopf/$_pkgname"
license=('MIT')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("${_pkgname}::git+${url}.git")
md5sums=('SKIP')

pkgver() {
	cd $_pkgname
	printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/${_pkgname}"
    make PREFIX="$pkgdir/usr" install

    cd "$pkgdir/usr/share/hyprevents"
    sed -i 's|^EVENT_HANDLER=.*|EVENT_HANDLER="/usr/share/hyprevents/event_handler"|' event_loader

    cd "$pkgdir/usr/bin"
    sed -i 's|^EVENT_LOADER=.*|EVENT_LOADER="/usr/share/hyprevents/event_loader"|' hyprevents
}
