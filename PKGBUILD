# Maintainer: William Varmus <0@willvar.tw>

pkgname=ossfs-bin
pkgver=1.91.10
pkgrel=1
pkgdesc='FUSE-based file system backed by Alibaba Cloud OSS'
arch=('x86_64')
url="https://github.com/aliyun/ossfs"
license=('GPL-2.0-only')
depends=('fuse2' 'curl' 'libxml2-legacy' 'openssl')
provides=('ossfs')
conflicts=('ossfs' 'ossfs-git')
source=("ossfs_${pkgver}_rockylinux9_x86_64.rpm::https://gosspublic.alicdn.com/ossfs/ossfs_${pkgver}_rockylinux9_x86_64.rpm")
sha256sums=('4c0f08ccac03b590239872527fa26ef8067e623c2d4a2dc5d8e593144dac894c')

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
