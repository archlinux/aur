# Maintainer: Mario Finelli <mario at finel dot li>
# Contributor: Hubert Maraszek <marach5 at gmail dot com>

pkgname=mp3tag
pkgver=3.36.1
pkgrel=1
pkgdesc="The universal tag editor"
arch=(i686 x86_64)
url="https://www.mp3tag.de/en/"
license=(custom)
depends=(wine)
makedepends=(7zip)
source=(mp3tag
        LICENSE
        mp3tag.desktop
        mp3tag.png)
source_i686=("https://download.mp3tag.de/${pkgname}-v${pkgver}-setup.exe")
source_x86_64=("https://download.mp3tag.de/${pkgname}-v${pkgver}-x64-setup.exe")
sha256sums=('378eabc03c7a4c6aa56c5aa90141204a04b727f7dc60e66a7f36a87a7eeae7d8'
            '18967b634e69d8ccb08383d42a49ced3c0b11c632649a15c3a6a55e3a27f62e9'
            'bc0c7b8a7a9f9ee92dfe2f1880ef5d91920473713b5d60e4afa361d69a446798'
            'a3e09f7cda34bc31b3b5b1d7cf2010c3b17847c141ef5a074472eb72f760f6bf')
sha256sums_i686=('a24d7797db88e501b2fb9f16eca1a07e2712ea96ea3b514317d283fa7d6ba53f')
sha256sums_x86_64=('a977861003a87b1f00f2e0c91263c61bf12d457c6d457b367ce5f69de28fbea0')
options=(!emptydirs !strip)

prepare() {
  if [[ $CARCH == i686 ]]; then
    7z -y -o"$pkgname-$pkgver" x "${pkgname}-v${pkgver}-setup.exe"
  else
    7z -y -o"$pkgname-$pkgver" x "${pkgname}-v${pkgver}-x64-setup.exe"
  fi
}

package() {
  cd "$pkgname-$pkgver"

  install -dm0755 "$pkgdir/usr/share/$pkgname"
  cp -a * "$pkgdir/usr/share/$pkgname"

  rm -rf "$pkgdir/usr/share/mp3tag/\$PLUGINSDIR" \
    "$pkgdir/usr/share/mp3tag/\$R0"
  find "$pkgdir/usr/share/$pkgname" -type d -exec chmod 755 "{}" \;
  find "$pkgdir/usr/share/$pkgname" -type f -exec chmod 644 "{}" \;

  install -Dm0755 "$srcdir/mp3tag" "$pkgdir/usr/bin/mp3tag"
  install -Dm0644 "$srcdir/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm0644 "$srcdir/mp3tag.png" \
    "$pkgdir/usr/share/pixmaps/mp3tag.png"
  install -Dm0644 "$srcdir/mp3tag.desktop" \
    "$pkgdir/usr/share/applications/mp3tag.desktop"
}

# vim: set ts=2 sw=2 et:
