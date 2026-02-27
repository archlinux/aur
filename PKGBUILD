# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Juan Tascon <juan at horlux dot org>
pkgname=wtfutil-bin
pkgver=0.49.0
pkgrel=1
pkgdesc="Personal information dashboard for your terminal"
arch=('x86_64' 'aarch64' 'armv6h')
url="https://wtfutil.com"
license=('MPL-2.0')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source_x86_64=("https://github.com/wtfutil/wtf/releases/download/v$pkgver/wtf_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/wtfutil/wtf/releases/download/v$pkgver/wtf_${pkgver}_linux_arm64.tar.gz")
source_armv6h=("https://github.com/wtfutil/wtf/releases/download/v$pkgver/wtf_${pkgver}_linux_armv6.tar.gz")
noextract=("wtf_${pkgver}"_linux_*.tar.gz)
sha256sums_x86_64=('b29cabf18b4a7357daebbb5418e40c506564dbcdf94ee7846879cf3442333193')
sha256sums_aarch64=('0b6e578a5f3aefaca99576f4ee80376657b678a8bcdda30929e52edd6db587ba')
sha256sums_armv6h=('e37ce2e8297e7fbab81919a3cc54abbcb7fb994e3365cd4b75069d3791669615')

prepare() {
  mkdir -p "${pkgname%-bin}-$pkgver"
  bsdtar xf "wtf_${pkgver}"_linux_*.tar.gz -C "${pkgname%-bin}-$pkgver"
}

package() {
  cd "${pkgname%-bin}-$pkgver"
  install -Dm755 "${pkgname%-bin}" -t "$pkgdir/usr/bin/"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/${pkgname%-bin}/"
}
