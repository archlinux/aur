# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Juan Tascon <juan at horlux dot org>
pkgname=wtfutil-bin
pkgver=0.51.0
pkgrel=1
pkgdesc="Personal information dashboard for your terminal"
arch=('x86_64' 'aarch64')
url="https://wtfutil.com"
license=('MPL-2.0')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source_x86_64=("https://github.com/wtfutil/wtf/releases/download/v$pkgver/wtf_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/wtfutil/wtf/releases/download/v$pkgver/wtf_${pkgver}_linux_arm64.tar.gz")
noextract=("wtf_${pkgver}"_linux_*.tar.gz)
sha256sums_x86_64=('5b1670e8a6a2bfcddf699bccbaae6b53263d75b87ef099d8e2a837c1d5ffc81b')
sha256sums_aarch64=('125ffb623e610dfc8076034b57cf0c13e8422b52924177ce752c541c6e356203')

prepare() {
  mkdir -p "${pkgname%-bin}-$pkgver"
  bsdtar xf "wtf_${pkgver}"_linux_*.tar.gz -C "${pkgname%-bin}-$pkgver"
}

package() {
  cd "${pkgname%-bin}-$pkgver"
  install -Dm755 "${pkgname%-bin}" -t "$pkgdir/usr/bin/"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/${pkgname%-bin}/"
}
