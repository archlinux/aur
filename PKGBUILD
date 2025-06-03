# Maintainer: Melvyn <melvyn2@brcok.tk>
# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
# Forked from: aur/linux-apfs-dkms-git
# Contributor: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: ManU
# Forked from aur/linux-can-dkms
# Contributor: Kyle Manna <kyle(at)kylemanna(dot)com>

pkgname=linux-apfs-rw-dkms-git
epoch=1
pkgver=0.3.14.r0.g7d8dc88
pkgrel=1
pkgdesc="Experimental APFS kernel module with Write support (DKMS)"
arch=('any')
url="https://github.com/linux-apfs/linux-apfs-rw"
license=('GPL-2.0-only')
depends=('dkms')
makedepends=('git' 'bash')
source=("git+${url}.git")
sha256sums=('SKIP')

prepare() {
  cd "$srcdir/linux-apfs-rw"
}

pkgver() {
  cd "$srcdir/linux-apfs-rw"
  git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/linux-apfs-rw"
  dkms_version=$(grep PACKAGE_VERSION dkms.conf | sed -r 's#PACKAGE_VERSION="([0-9.]+)"#\1#')
  dkms_dir="${pkgdir}/usr/src/linux-apfs-rw-$dkms_version/"
  ./genver.sh
  install -Ddm755 "${dkms_dir}"
  cp -dr --no-preserve=ownership * "$dkms_dir"
  rm "$dkms_dir/genver.sh"
}
