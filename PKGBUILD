# Maintainer: Greg Holmes <greg at greg dot holmes dot name>
pkgname=systemd-timer-podman-system-prune-git
pkgver=r2.9b61206
pkgrel=1
pkgdesc="Systemd timer to force a podman system prune on boot and daily"
arch=('any')
url="https://github.com/greboid/systemd-podman-system-prune"
license=('MIT')
makedepends=('git')
depends=('systemd-service-podman-system-prune')
provides=('systemd-timer-podman-system-prune')
source=(
  "$pkgname"::"git+https://github.com/greboid/systemd-podman-system-prune.git"
)
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
        cd "$srcdir/$pkgname"
        install -Dm 644 podman-system-prune.timer "$pkgdir/usr/lib/systemd/system/podman-system-prune.timer"
}
