# Maintainer: drzee <info@drzee.net>

pkgname=aws-mountpoint-s3-bin
pkgver=1.24.0
pkgrel=1
pkgdesc="Offical AWS S3 mount tools. This allows mounting S3 buckets into the file system. Not full POSIX support, see: https://docs.aws.amazon.com/AmazonS3/latest/userguide/mountpoint.html for details"
arch=('x86_64' 'aarch64')
url="https://github.com/awslabs/mountpoint-s3"
license=('APACHE')
groups=()
depends=('fuse2')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source_x86_64=(https://s3.amazonaws.com/mountpoint-s3-release/${pkgver}/x86_64/mount-s3-${pkgver}-x86_64.tar.gz)
source_aarch64=(https://s3.amazonaws.com/mountpoint-s3-release/${pkgver}/arm64/mount-s3-${pkgver}-arm64.tar.gz)
# Checksums 
sha256sums_aarch64=('9f97026c9feabd0e4d128206f1846ee317e6c4f21846914dfe4268d110c892c4')
sha256sums_x86_64=('a99bea20510eaabaf9d7cbfe95ab221a11005cacaa77cfc311a2912bbbdbfd72')
noextract=()
# We set options here to superseed the default makepkg.conf options. We dont whant debug build or strip debug info from the package. Its not relevant for a binary repackage of the upstream package.
options=(!debug !strip)

package() {
  cd "$srcdir"

  install -dm755 "$pkgdir"/opt/aws/mountpoint-s3/
  cp -R "${srcdir}"/bin/ "${pkgdir}/opt/aws/mountpoint-s3"
  cp -R "${srcdir}"/LICENSE "${pkgdir}/opt/aws/mountpoint-s3"
  cp -R "${srcdir}"/NOTICE "${pkgdir}/opt/aws/mountpoint-s3"
  cp -R "${srcdir}"/THIRD_PARTY_LICENSES "${pkgdir}/opt/aws/mountpoint-s3"
  cp -R "${srcdir}"/VERSION "${pkgdir}/opt/aws/mountpoint-s3"

  mkdir -p "${pkgdir}/usr/bin/"
  ln -s /opt/aws/mountpoint-s3/bin/mount-s3 "${pkgdir}/usr/bin/mount-s3"
  
}

