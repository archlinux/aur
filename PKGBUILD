# Maintainer: drzee <info@drzee.net>
pkgname=amazon-q-bin
pkgver=1.18.1
pkgrel=1
pkgdesc="Amazon Q CLI for Linux. See: https://docs.aws.amazon.com/amazonq/latest/qdeveloper-ug/command-line.html for details"
arch=('x86_64' 'aarch64')
url="https://github.com/aws/q-cli"
license=('APACHE')
groups=()
depends=('glibc>=2.34')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source_x86_64=(${pkgname}-${pkgver}-x86_64.zip::https://desktop-release.q.us-east-1.amazonaws.com/${pkgver}/q-x86_64-linux.zip)
source_aarch64=(${pkgname}-${pkgver}-aarch64.zip::https://desktop-release.q.us-east-1.amazonaws.com/${pkgver}/q-aarch64-linux.zip)
# Checksums 
sha256sums_aarch64=('950943004337136f21c1f30e82ede2735b234381bc92f040dbabf8129e53d71b')
sha256sums_x86_64=('185ec9da9181be1471101d0141f27d2d4b705a44d049b3ebdbf62c700c853655')
noextract=()
# We set options here to superseed the default makepkg.conf options. We dont whant debug build or strip debug info from the package. Its not relevant for a binary repackage of the upstream package.
options=(!debug !strip)
install=${pkgname}.install

package() {
  install -d "$pkgdir/usr/bin/"
  install -Dm755 "$srcdir/q/bin/q" "$pkgdir/usr/bin/"
  install -Dm755 "$srcdir/q/bin/qterm" "$pkgdir/usr/bin/"
  install -Dm755 "$srcdir/q/bin/qchat" "$pkgdir/usr/bin/"
}
