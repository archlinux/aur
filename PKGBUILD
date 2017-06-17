# Maintainer: Vinicius Massuchetto <vmassuchetto@gmail.com>

pkgname=magarena
pkgver=1.85
pkgrel=1
pkgdesc="A single-player fantasy card game played against a computer opponent"
arch=(any)
url="https://magarena.github.io/"
license=("GPLv3")
depends=("java-runtime-common")
source=("https://github.com/magarena/magarena/releases/download/$pkgver/Magarena-$pkgver.zip"
        "magarena.png" "magarena.desktop" "magarena")
md5sums=("94fa171cf2d31bd1079023069898cbaa"
         "SKIP" "SKIP" "SKIP")

package() {
    mkdir -p "$pkgdir"/usr/bin/
    mkdir -p "$pkgdir"/usr/share/{applications,icons/hicolor/128x128/game,licenses/magarena,magarena}

    install -Dm755 magarena         "$pkgdir"/usr/bin/
    install -Dm644 magarena.png     "$pkgdir"/usr/share/icons/hicolor/128x128/game/
    install -Dm644 magarena.desktop "$pkgdir"/usr/share/applications/

    cd "$srcdir/Magarena-$pkgver/"
    install -Dm644 Magarena.jar     "$pkgdir"/usr/share/magarena/
    install -Dm755 Magarena.sh      "$pkgdir"/usr/share/magarena/
    cp      -rf    lib              "$pkgdir"/usr/share/magarena/

    tar -cvzf "$pkgdir"/usr/share/magarena/default-userdata.tar.gz Magarena
    chmod 755 "$pkgdir"/usr/share/magarena
}
