pkgname=power-profiles-hooks-git
_pkgname=power-profiles-hooks
pkgver=r5.8338b75
pkgrel=1
pkgdesc="Daemon to launch commands on power-profiles-daemon profile change"
arch=('x86_64')
url="https://github.com/thesola10/power-profiles-hooks"
license=('CC0-1.0')
depends=('power-profiles-daemon'
         'python'
         'dbus-python'
         'python-gobject')
makedepends=('git'
             'make'
             'gettext')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd $_pkgname
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/$_pkgname"
    mkdir -p "$pkgdir/usr/lib/systemd/system" "$pkgdir/usr/bin" $pkgdir/etc/power-profiles.d/{balanced,power-saver,performance}
    make DESTDIR="$pkgdir" install
}
