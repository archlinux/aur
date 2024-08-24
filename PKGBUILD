# Maintainer: Filip Markovic <f12markovic at gmail dot com>
_pkgname="hyprprop"
pkgname="$_pkgname-git"
pkgver=r0.0000000
pkgrel=1
pkgdesc="xprop for Hyprland"
arch=(x86_64 aarch64)
url="https://github.com/vilari-mickopf/$_pkgname"
depends=('hyprevents-git' 'git' 'socat' 'slurp' 'jq')
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

    cd "$pkgdir/usr/bin"
    sed -i 's|^EVENT_HANDLER=.*|EVENT_HANDLER="/usr/share/hyprprop/event_handler"|' hyprprop
}
