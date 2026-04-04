# Maintainer: Reasonance team
pkgname=reasonance-bin
pkgver=3.0.4
pkgrel=1
pkgdesc='Lightweight IDE for vibecoders who work with LLMs (prebuilt binary)'
arch=('x86_64')
url='https://github.com/TNASRLSB/reasonance'
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'libsoup3')
provides=('reasonance')
conflicts=('reasonance')
source=("$pkgname-$pkgver.deb::$url/releases/download/v$pkgver/reasonance_${pkgver}_amd64.deb")
sha256sums=('SKIP')

package() {
  # .deb is an ar archive containing data.tar.* — extract it first
  bsdtar -xf "$pkgname-$pkgver.deb"
  bsdtar -xf data.tar.* -C "$pkgdir/"

  # License
  install -Dm644 /dev/null "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  if [ -f "$pkgdir/usr/share/doc/reasonance/copyright" ]; then
    mv "$pkgdir/usr/share/doc/reasonance/copyright" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    rm -rf "$pkgdir/usr/share/doc"
  fi
}
