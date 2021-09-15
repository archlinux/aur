# Maintainer: INhBQfUQO2eFzulN <281587887a at protonmail dot ch>
_pkgname=spotiflyer
pkgname="${_pkgname}-bin"
pkgver=3.3.0
pkgrel=2
pkgdesc="Kotlin multiplatform music downloader, supports Spotify/Gaana/Youtube Music/Jio Saavn."
arch=('x86_64')
url="https://github.com/Shabinder/SpotiFlyer"
license=('GPL3')
depends=("java-runtime")
source=("spotiflyer-$pkgver.jar::https://github.com/Shabinder/SpotiFlyer/releases/download/v$pkgver/SpotiFlyer-linux-x64-$pkgver.jar"
        "${pkgname}.desktop")
sha256sums=('3001d7735ad0143e395a47e58ff60264388ab4b63008fed6d406adbd938558a7'
            'ee9c82144932a2ebd374b6568c91bce83ca79ccf2f5864708d68a3c666b6b97e')

package() {
  cd "$srcdir"
  install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -Dm644 "$srcdir/drawable/${_pkgname}.png" "$pkgdir/usr/share/pixmaps/${_pkgname}.png"
  install -Dm644 "spotiflyer-$pkgver.jar" "$pkgdir/usr/share/java/spotiflyer.jar"
  cat << EOF | install -Dm755 /dev/stdin "$pkgdir/usr/bin/spotiflyer"
#!/bin/sh
exec java -jar /usr/share/java/spotiflyer.jar "\$@"
EOF
}
