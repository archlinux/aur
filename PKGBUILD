# Maintainer: Kagamma <kagamma(dot)km(at)gmail(dot)com>

pkgname=tparted-git
pkgver=.r240.a29e1f4
pkgrel=1
pkgdesc="Text-based user interface (TUI) frontend for parted, based on Free Vision application framework."
arch=(x86_64)
url="https://github.com/Kagamma/tparted"
license=('GPL-3.0')
makedepends=(git make fpc)
depends=(parted util-linux)
optdepends=('dosfstools: for fat operations'
            'exfatprogs: for exfat operations'
            'e2fsprogs: for ext2/3/4 operations'
            'ntfs-3g: for ntfs operations'
            'btrfs-progs: for btrfs operations'
            'bcachefs-tools: for bcachefs operations'
            'xfsprogs: for xfs operations'
            'jfsutils: for jfs operations'
            'f2fs-tools: for f2fs operations'
            'nilfs-utils: for nilfs2 operations'
            'cryptsetup: LUKS')
conflicts=(tparted-bin tparted-bin-debug)
source=(git+https://github.com/Kagamma/tparted)
md5sums=('SKIP')

pkgver() {
          cd tparted
          printf "%s.r%s.%s" "$(git describe --abbrev=0 | sed 's/\([^-]*-g\)/r\1/;s/-/./g')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
          # Build tools
          cd tparted
          make build
}

package() {
          cd tparted
          # Install binaries & desktop file
          install -Dm755 ./bin/tparted "${pkgdir}/usr/bin/tparted"
}
