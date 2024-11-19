# Maintainer: Matthias De Bie <matthias@madebit.be>
pkgname=firefox-profiles-selector
pkgver=1.0.2
pkgrel=1
pkgdesc="Allow to select firefox profile when open an external link"
arch=('any')
url="https://github.com/linhx/firefox-profiles-selector"
license=('GPL3')
depends=()
optdepends=()
makedepends=()
source=("https://github.com/linhx/firefox-profiles-selector/releases/download/v.$pkgver/firefox-profiles-selector_v$pkgver.tar.gz")
sha512sums=('26f151d032408a44b43ccc216a5e476140569f07fac49d24a49af84ffd9d05b0c6f5200e8d27b9ef475517a59e5577a0a3c2a0642e44b54c8416162c22c01734')
install=$pkgname.install

build() {
    cd "$srcdir"

    cat <<EOF > $pkgname.desktop
[Desktop Entry]
Version=$pkgver
Name=Firefox profiles selector
Comment=Firefox profiles selector
Exec=/opt/firefox-profiles-selector/firefox-profiles-selector %u
Terminal=false
Type=Application
MimeType=text/html;text/xml;application/xhtml+xml;application/xml;application/vnd.mozilla.xul+xml;application/rss+xml;application/rdf+xml;image/gif;image/jpeg;image/png;x-scheme-handler/http;x-scheme-handler/https;
Icon=/opt/firefox-profiles-selector/icon.png
EOF
}

package() {
    cd "$srcdir"

    install -Dm755 $pkgname "$pkgdir/opt/$pkgname/$pkgname"
    install -Dm644 config.ini "$pkgdir/opt/$pkgname/config.ini.dist"
    install -Dm644 icon.png "$pkgdir/opt/$pkgname/icon.png"

    install -Dm644 $pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"

}
