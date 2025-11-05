pkgname=power-profiles-hooks-fixed
_pkgname=power-profiles-hooks
pkgver=r11.d93639e
pkgrel=1
pkgdesc="Daemon to launch commands on power-profiles-daemon profile change"
arch=('x86_64')
url="https://github.com/eliteSchwein/power-profiles-hooks"
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
conflicts=("power-profiles-hooks-git")
provides=("power-profiles-hooks-git")

pkgver() {
    cd $_pkgname
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/$_pkgname"
    mkdir -p "$pkgdir/usr/lib/systemd/system" "$pkgdir/usr/bin" $pkgdir/etc/power-profiles.d/{balanced,power-saver,performance}
    make DESTDIR="$pkgdir" install
}
