# Maintainer: Antoine Viallon <antoine@lesviallon.fr>

_pkgname=pacman-hook-systemd-restart
pkgname=${_pkgname}-git
pkgdesc="An alpm hook to automatically restart updated services, or the systemd daemon."
pkgver=r1.9b9506b
pkgrel=3
arch=(any)
source=("git+https://gitlab.com/aviallon/pacman-hook-systemd-restart.git")
sha1sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
	install -D -m 644 "$srcdir/${_pkgname}/40-systemd-service-restart.hook" "$pkgdir/usr/share/libalpm/hooks/40-systemd-service-restart.hook"
	install -D -m 755 "$srcdir/${_pkgname}/systemd-restart-service" "$pkgdir/usr/share/pacman-hook-systemd-restart/systemd-restart-service"
}

