# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Juan Tascon <juan at horlux dot org>
pkgname=wtfutil-bin
pkgver=0.47.1
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
sha256sums_x86_64=('5e2428064eb915c875de6e2759f7ac08d2137cf9d2434660b51ba3746cf64f87')
sha256sums_aarch64=('8016102ab3f5df3a8d544617e8121219f19fe06bb293525db798ecbd57f40e93')
sha256sums_armv6h=('c78df750d2a19700c0eda96913345825dffa9f789b5c2926d04eefd29aa57adf')

prepare() {
  mkdir -p "${pkgname%-bin}-$pkgver"
  bsdtar xf "wtf_${pkgver}"_linux_*.tar.gz -C "${pkgname%-bin}-$pkgver"
}

package() {
  cd "${pkgname%-bin}-$pkgver"
  install -Dm755 "${pkgname%-bin}" -t "$pkgdir/usr/bin/"
  install -Dm644 {README,CHANGELOG}.md -t "$pkgdir/usr/share/doc/${pkgname%-bin}/"
}
