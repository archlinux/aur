# Maintainer : Ashcon Mohseninia <ashcon50@gmail.com>

pkgname="razer-laptop-control-dkms-git"
pkgver=1.0.2
pkgrel=2
pkgdesc="Kernel module for razer laptop's for RGB, fan and power control"
arch=('i686' 'x86_64')
url="https://github.com/rnd-ash/razer-laptop-control"
license=("GPL2")
depends=('dkms' 'udev')
makedepends=('git')
source=("git+https://github.com/rnd-ash/razer-laptop-control")
md5sums=("SKIP")
conflicts=("openrazer-meta" "openrazer-driver-dkms" "openrazer-meta-git" "openrazer-daemon-git")

prepare() {
    cd $reponame
    echo "$pwd"
}

package() {
    cd "razer-laptop-control/driver"
    make DESTDIR="$pkgdir" driver_dkms
    cd ".."
    mkdir -p "$pkgdir/etc/udev/rules.d/"
    cp "udev/99-razerlc.rules" "udev/razer_perms.sh" "$pkgdir/etc/udev/rules.d/"
    chmod +x "$pkgdir/etc/udev/rules.d/razer_perms.sh"
}
