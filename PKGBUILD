# Maintainer: travisghansen <travisghansen@yahoo.com>

_pkgname="objectivefs"
pkgname=objectivefs-bin
pkgver=7.2
pkgrel=1
pkgdesc="Scalable High Performance File Storage"
arch=(aarch64 x86_64)
url="https://objectivefs.com/"
license=('LicenseRef-ObjectiveFS')
# requires fusermount binary
depends=('glibc' 'fuse2')
source=("https://objectivefs.com/license")
source_x86_64=("https://objectivefs.com/user/download/ac24htfht/objectivefs_${pkgver}_amd64.deb")
source_aarch64=("https://objectivefs.com/user/download/ac24htfht/objectivefs_${pkgver}_arm64.deb")
sha256sums=('31cd1089a1438e5a8d1d3be1bdc67c646a161b6b1fbcd22ac083660ae6ae8f0c')
sha256sums_aarch64=('07620f1ee646236c1f5fc9345508f0ed2d27a2b38a0ff8af42eea99024d41a90')
sha256sums_x86_64=('85808244dde269b822bbe7da52b4f9385b5bff34eb781107a162e7175c5b6eb1')

package() {
  cd "$srcdir"
  bsdtar -xf ${srcdir}/data.tar.gz -C ${pkgdir}/
  install -D -m644 license "${pkgdir}/usr/share/licenses/${pkgname}/ObjectiveFS"
  mkdir -p "${pkgdir}/usr/bin/"
  mv "${pkgdir}/sbin/mount.objectivefs" "${pkgdir}/usr/bin"
  rm -rf "${pkgdir}/sbin"
  chown root:root -vR "${pkgdir}/"
  chmod 755 -vR "${pkgdir}/"
}
