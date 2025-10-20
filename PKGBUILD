# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Juan Tascon <juan at horlux dot org>
pkgname=wtfutil-bin
pkgver=0.47.0
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
sha256sums_x86_64=('80f37b3dad937b8b6284ccb2b79586d6f7808ec37856d839d065f97e5f13231b')
sha256sums_aarch64=('a34f7aeac2828a0103f41bac0208da14e98053f2b205176ec63dea1b36f0ae91')
sha256sums_armv6h=('687950250bc61d3401629726940def93a22800e6a011bbb0315ef1c78d6ad150')

prepare() {
  mkdir -p "${pkgname%-bin}-$pkgver"
  bsdtar xf "wtf_${pkgver}"_linux_*.tar.gz -C "${pkgname%-bin}-$pkgver"
}

package() {
  cd "${pkgname%-bin}-$pkgver"
  install -Dm755 "${pkgname%-bin}" -t "$pkgdir/usr/bin/"
  install -Dm644 {README,CHANGELOG}.md -t "$pkgdir/usr/share/doc/${pkgname%-bin}/"
}
