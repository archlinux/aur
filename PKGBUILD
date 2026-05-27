# Maintainer: Juliandev02 <julian@strawberryfoundations.org>

pkgname=tunneled-bin
_pkgname=tunneled
pkgver=2.5.2
pkgrel=2
pkgdesc="A simple and powerful CLI tool for creating TCP tunnels (Precompiled Binary)"
arch=('x86_64') # Falls deine GitHub Action nur für x86_64 baut, hier belassen
url="https://github.com/Strawberry-Foundations/tunneled"
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'openssl')
provides=("$_pkgname")
conflicts=("$_pkgname")

# Wir laden die fertige Binary aus den Release-Assets und den Rest direkt aus dem Repo
source=(
  "$_pkgname-$pkgver::https://github.com/Strawberry-Foundations/tunneled/releases/download/v$pkgver/tunneled-linux-amd64"
  "LICENSE-$pkgver::$url/raw/v$pkgver/LICENSE"
  "README-$pkgver::$url/raw/v$pkgver/README.md"
  "config.example-$pkgver.yml::$url/raw/v$pkgver/config.example.yml"
  "services.example-$pkgver.yml::$url/raw/v$pkgver/services.example.yml"
)

# SKIP sorgt dafür, dass du nicht bei jedem Release die Prüfsummen neu generieren musst
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

package() {
    # 1. Die fertige Binary installieren
    install -Dm755 "$srcdir/$_pkgname-$pkgver" "$pkgdir/usr/bin/$_pkgname"

    # 2. Lizenz und Doku installieren
    install -Dm644 "$srcdir/LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
    install -Dm644 "$srcdir/README-$pkgver" "$pkgdir/usr/share/doc/$_pkgname/README.md"
    
    # 3. Die Beispiel-Konfigurationen installieren
    install -Dm644 "$srcdir/config.example-$pkgver.yml" "$pkgdir/usr/share/$_pkgname/config.example.yml"
    install -Dm644 "$srcdir/services.example-$pkgver.yml" "$pkgdir/usr/share/$_pkgname/services.example.yml"
}