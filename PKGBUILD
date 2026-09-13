# Maintainer: William Varmus <0@willvar.tw>

pkgname=ossfs-bin
pkgver=1.91.12
pkgrel=1
pkgdesc='FUSE-based file system backed by Alibaba Cloud OSS'
arch=('x86_64')
url="https://github.com/aliyun/ossfs"
license=('GPL-2.0-only')
depends=('fuse2' 'curl' 'libxml2-legacy' 'openssl')
provides=('ossfs')
conflicts=('ossfs' 'ossfs-git')
source=("ossfs_${pkgver}_rockylinux9_x86_64.rpm::https://gosspublic.alicdn.com/ossfs/ossfs_${pkgver}_rockylinux9_x86_64.rpm")
sha256sums=('bfb7a2a4a2f7543781e0356b0a076a977365854ba5387b9285f91910a35e552a')

prepare() {
  cd "${srcdir}"
  # Extract RPM package
  bsdtar -xf "ossfs_${pkgver}_rockylinux9_x86_64.rpm"
}

package() {
  cd "${srcdir}"
  # Install binary
  install -Dm755 usr/local/bin/ossfs "${pkgdir}/usr/bin/ossfs"
  # Install man page
  install -Dm644 usr/local/share/man/man1/ossfs.1 "${pkgdir}/usr/share/man/man1/ossfs.1"
}
