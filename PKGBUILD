# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Juan Tascon <juan at horlux dot org>
pkgname=wtfutil-bin
pkgver=0.50.0
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
sha256sums_x86_64=('448c8903ff6b843028fd5eac07c0f89a0c83dd1158d9b04370d274ac59721dc2')
sha256sums_aarch64=('4636bb81e49f049fe616779357670eaa361d4016dcdcbaf0a8e5a6fcae8d3540')
sha256sums_armv6h=('5a8c6d86ef00aeaf2c50b982f949eeb9b8609f6a6281463b3d47b47c2c30de6c')

prepare() {
  mkdir -p "${pkgname%-bin}-$pkgver"
  bsdtar xf "wtf_${pkgver}"_linux_*.tar.gz -C "${pkgname%-bin}-$pkgver"
}

package() {
  cd "${pkgname%-bin}-$pkgver"
  install -Dm755 "${pkgname%-bin}" -t "$pkgdir/usr/bin/"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/${pkgname%-bin}/"
}
