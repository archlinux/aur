# Maintainer: gbr <gbr@protonmail.com>
_pkgname=maxautoclicker
pkgname=maxautoclicker-bin
pkgver=1.5.8
pkgrel=1
pkgdesc='Emulate and automate your mouse clicks'
arch=('x86_64')
url='https://maxautoclicker.blogspot.com/'
license=('custom')
depends=('gtk2' 'libxtst')
provides=('maxautoclicker')
source=("https://github.com/mautosoft/maxautoclicker/releases/download/v$pkgver/$_pkgname-${pkgver}_amd64.deb")
sha256sums=('527781eb24d112aea271876f2005e2108f638fb753e7467f13c7fea172c48116')

prepare() {
  mkdir $_pkgname-$pkgver
  tar -xf data.tar.xz -C $_pkgname-$pkgver
  sed -i '/^Icon=/c Icon=maxautoclicker' "$_pkgname-$pkgver/usr/share/applications/$_pkgname.desktop"
}

package() {
  cd $_pkgname-$pkgver
  install -Dm755 -t "$pkgdir/usr/bin" "usr/bin/$_pkgname"
  install -Dm644 -t "$pkgdir/usr/share/applications" "usr/share/applications/$_pkgname.desktop"
  install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/96x96/apps" "usr/share/$_pkgname/$_pkgname.png"
  install -Dm644 "usr/share/doc/$_pkgname/copyright" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
