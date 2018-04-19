# Maintainer: Nils Czernia <nils[at]czserver[dot]de>

pkgname=rapsberry-overlayroot-git
_pkgname=rapsberry-overlayroot-git
pkgver=493f431
pkgrel=1
pkgdesc="OverlayFS root file system for RaspberryRi"
arch=("armv6l" "armv7h" "aarch64")
url="https://github.com/nils-werner/arch-overlayroot"
license=("MIT")
depends=("mkinitcpio" "arch-install-scripts" "sudo")
source=("${_pkgname}::git+https://github.com/nils-werner/raspi-overlayroot.git"
        "raspi-overlayroot.install")
install=raspi-overlayroot.install
sha256sums=("SKIP"
            "b2e7d77110b8e327d75e0e1d48053eae80afb96b53df9078fb85514cf5cdcd0e")

pkgver() {
  cd ${srcdir}/${pkgname}
  git describe --always | sed "s|-|.|g"
}

package() {
  cd "$srcdir/${_pkgname}"

  install -Dm644 "initcpio-install-overlayroot" "$pkgdir/usr/lib/initcpio/install/overlayroot"
  install -Dm644 "initcpio-hooks-overlayroot" "$pkgdir/usr/lib/initcpio/hooks/overlayroot"
  install -Dm644 "journald-volatile-storage.conf" "$pkgdir/etc/systemd/journald.conf.d/volatile-storage.conf"
  install -Dm755 "rwrootfs" "$pkgdir/usr/bin/rwrootfs"
  install -Dm755 "fsck.overlay" "$pkgdir/usr/bin/fsck.overlay"
  install -Dm644 "overlayroot-motd.sh" "$pkgdir/etc/profile.d/overlayroot-motd.sh"
}

