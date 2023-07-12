# Maintainer: dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: Markus Schanz

### Based on https://aur.archlinux.org/packages/pacman-boot-backup-hook version 1.5.

_pkgname=pacman-boot-backup-hook
pkgname="${_pkgname}-nosystemd"
pkgver=1.6
pkgrel=4
pkgdesc="Pacman hook that creates a copy of the /boot directory when via a pacman operation something is changed there."
depends=('bash')
makedepends=('ncurses')
optdepends=('snap-pac: To save away the created backup in a btrfs snapshot of the root file system.')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
backup=('etc/pacman-boot-backup.conf')
arch=('any')
license=('MIT')
install="${_pkgname}.install"
changelog=CHANGELOG

source=(
  'LICENSE'
  'backup-boot-partition'
  '50_bootbackup.hook'
  'uu_bootbackup.hook'
  'pacman-boot-backup.conf'
  "${changelog}"
  "${install}"
)

sha256sums=(
  'b2602c4a5c6baacc5dc7a935dd5c6ded33be549323d394e09cd6ab7947e2dbf3'
  '2445f388b4bc94382d25e01175babc804821090706d9ac69b5fadfbf5c60d5a9'
  '79f955a6a84f1226bc985f4a20c118175a8dc560d5146d1cc846abfd40632cb1'
  'd3f1031076e7bde42f8024680f33bac269e6a559c44f639b894cd62194b51137'
  '1cefb346964c3aa4db829bffa788c39839f7a0959f294c91cdb43ae591c8472d'
  'b9daab5122c391f395f2876d965ab4fe5af5f8cd934ffb24de7d05f6f3c7daee'
  'ddce28959923a7eaad7bf4e72be30f01be83372d9445e6a3695b4d089d43ae1f'
)

package() {
  install -Dvm 0644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -Dvm 0644 "$srcdir/pacman-boot-backup.conf" "$pkgdir/etc/pacman-boot-backup.conf"

  install -Dvm 0644 "$srcdir/50_bootbackup.hook" "$pkgdir/usr/share/libalpm/hooks/50_bootbackup.hook"
  install -Dvm 0644 "$srcdir/uu_bootbackup.hook" "$pkgdir/usr/share/libalpm/hooks/uu_bootbackup.hook"

  install -Dvm 0755 "$srcdir/backup-boot-partition" "$pkgdir/usr/share/libalpm/scripts/backup-boot-partition"
}
