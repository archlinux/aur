# Maintainer: Hadi Chokr
pkgname=mkinitcpio-sd-zfs-poscat
pkgver=0.1
_sd_zfs_commit=dece62dfc2b018b7754b29220d9e239ea5056b98
pkgrel=1
pkgdesc="Systemd-based mkinitcpio hooks for ZFS (from poscat0x04)"
arch=('any')
url="https://github.com/poscat0x04/mkinitcpio-sd-zfs"
license=('CC0')
depends=('mkinitcpio' 'systemd')
conflicts=('mkinitcpio-sd-zfs')
source=("mkinitcpio-sd-zfs.tar.gz::https://github.com/poscat0x04/mkinitcpio-sd-zfs/archive/${_sd_zfs_commit}.tar.gz")
sha256sums=('3dcc79915e41c5326135f2c3a8787fd2abfc2fc50c349327ef41222440ba2c4a')

package() {
  cd "$srcdir/mkinitcpio-sd-zfs-${_sd_zfs_commit}"

  # install initcpio install scripts
  install -Dm644 sd-zfs.initcpio.install "$pkgdir/usr/lib/initcpio/install/sd-zfs"
  install -Dm644 zfs-shutdown.initcpio.install "$pkgdir/usr/lib/initcpio/install/zfs-shutdown"

  # install helper scripts
  install -Dm755 parse-cmdline "$pkgdir/usr/lib/zfs/initcpio/parse-cmdline"
  install -Dm755 zfs-set-env "$pkgdir/usr/lib/zfs/initcpio/zfs-set-env"
  install -Dm755 zfs-root-generator "$pkgdir/usr/lib/zfs/initcpio/zfs-root-generator"

  # install shutdown script and service drop-in
  install -Dm755 zfs.shutdown "$pkgdir/usr/lib/systemd/system-shutdown/zfs.shutdown"
  install -Dm644 zfs-shutdown.conf \
    "$pkgdir/usr/lib/systemd/system/mkinitcpio-generate-shutdown-ramfs.service.d/zfs-shutdown.conf"
}

