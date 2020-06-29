# Maintainer: Steven Spangler <132@ikl.sh>
pkgname="minirss-git"
pkgver=r3.2af2112
pkgrel=1
pkgdesc="A minuscule RSS notifier"
arch=("any")
url=https://github.com/132ikl/minirss
license=("GPL3")
depends=("xmlstarlet" "notification-daemon" "bash>=4.0" "xdg-utils")
makedepends=("git")
optdepends=("dunst: enable middle click open link functionality")
provides=("minirss")
conflicts=("minirss")
source=("git+${url}.git")
md5sums=("SKIP")

pkgver()  {
    printf "r%s.%s" "$(git -C minirss rev-list --count HEAD)" "$(git -C minirss rev-parse --short HEAD)"
}

package() {
    mkdir -p "${pkgdir}/usr/bin/" "${pkgdir}/usr/lib/systemd/user/"
    install -m755 "minirss/minirss" "${pkgdir}/usr/bin/minirss"
    install -m644 "minirss/minirss.service" "${pkgdir}/usr/lib/systemd/user/minirss.service"
}
