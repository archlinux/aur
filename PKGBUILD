# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=eppie-bin
pkgver=1.2.18
pkgrel=1
pkgdesc="Encrypted peer-to-peer independent email client."
arch=('x86_64' 'aarch64')
url="https://eppie.io"
license=('Apache-2.0')
depends=(
  'ca-certificates'
  'fontconfig'
  'glibc'
  'icu'
  'libgcc'
  'libproxy'
  'libstdc++'
  'libunwind'
  'libx11'
  'lttng-ust'
  'nss'
  'webkit2gtk-4.1'
  'zlib'
)
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!strip')
source=("${pkgname%-bin}.desktop")
source_x86_64=("${pkgname%-bin}-$pkgver-x64.tar.gz::https://github.com/Eppie-io/Eppie-App/releases/download/v$pkgver-preview/${pkgname%-bin}.desktop-linux-x64.tar.gz")
source_aarch64=("${pkgname%-bin}-$pkgver-arm64.tar.gz::https://github.com/Eppie-io/Eppie-App/releases/download/v$pkgver-preview/${pkgname%-bin}.desktop-linux-arm64.tar.gz")
noextract=("${pkgname%-bin}-$pkgver"-*)
sha256sums=('4c64ff2ca53e3daa04d1e7552f8ca34a9b62552bb103129abb730e6e9a9dd42b')
sha256sums_x86_64=('ce7a71dc9197b98844cdb9f768b2e47271794fa49391dbe21fc639f6f6eb25ea')
sha256sums_aarch64=('5b915e64d5b7866b7f906872715d8818a0242bb48f6a864b908f7a6f93c81c8e')

package() {
  install -d "$pkgdir/opt/${pkgname%-bin}"
  bsdtar xf "${pkgname%-bin}-$pkgver"-* -C "$pkgdir/opt/${pkgname%-bin}"

  install -d "$pkgdir/usr/bin"
  ln -s "/opt/${pkgname%-bin}/Eppie" "$pkgdir/usr/bin/${pkgname%-bin}"

  for i in 16 24 32 48 256; do
    install -d "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps"
    ln -s "/opt/${pkgname%-bin}/Assets/Icons/iconLogo.targetsize-${i}.png" \
      "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/${pkgname%-bin}.png"
  done

  install -Dm644 "$srcdir/${pkgname%-bin}.desktop" -t "$pkgdir/usr/share/applications/"
}
