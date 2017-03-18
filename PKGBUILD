# Maintainer: M0Rf30

pkgname=zerynth-studio
pkgver=2
pkgrel=1
pkgdesc="A powerful IDE for embedded programming in Python that enables the IoT"
arch=('x86_64')
url="https://www.zerynth.com/zerynth-studio/"
license=('COMMERCIAL')
depends=()
optdepends=()
source=("http://download.zerynth.com/installer/zerynth.tar.xz"
				"$pkgname.sh"
				"$pkgname.desktop")

package() {
  cd "$srcdir"
  rm zerynth.tar.xz

  install -D "$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

  for _i in 36 48 192; do
    install -Dm644 img/android-icon-${_i}x${_i}.png \
      "$pkgdir/usr/share/icons/hicolor/${_i}x${_i}/apps/$pkgname.png"
  done

  install -d "$pkgdir/opt/zerynth-studio"
  rm $pkgname.{sh,desktop}
  rm -r xz/{windows64,mac}
  cp -r * "$pkgdir/opt/$pkgname"
  chmod +x "$pkgdir/opt/$pkgname/zerynth"
  chmod +44 -R "$pkgdir/opt/$pkgname/"
}

md5sums=('SKIP'
         '566bd15aa6acedd409673ab634ab1148'
         '6cc82b387ddbee922b8e246efa5a6b97')
