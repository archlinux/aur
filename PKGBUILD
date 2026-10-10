# Maintainer: libuntu
# Join-only build of a co-op AI voice comedy game: the AI runs on the host's computer.
pkgname=do-not-redeem
pkgver=0.1.0
pkgrel=1
pkgdesc="Co-op comedy game: run a scam call center with friends and talk to AI victims by voice (join-only build)"
arch=('x86_64')
url="https://github.com/ardahzr/scam-call-center"
license=('LicenseRef-custom')
depends=('glibc' 'libx11' 'libxcursor' 'libxinerama' 'libxi' 'libxrandr' 'libglvnd' 'libpulse' 'alsa-lib' 'fontconfig')
optdepends=('steam: Steam lobbies (join with a code or an invite)')
options=('!strip' '!debug')  # stripping breaks the Godot binary / GDExtension libraries
source=("ScamCallCenter-linux-$pkgver.tar.gz::$url/releases/download/v$pkgver/ScamCallCenter-linux-$pkgver.tar.gz"
        "do-not-redeem.sh"
        "do-not-redeem.desktop"
        "do-not-redeem.svg"
        "LICENSE")
noextract=("ScamCallCenter-linux-$pkgver.tar.gz")
sha256sums=('ab14912523ba311e88a2e02998195afbedbde27e9995663da89db52cdcb64870'
            '8da0626e5682938aacbca4af0cac464915e0737591c2b3cf54f40b177985e3c3'
            '8b130ed0677fb4ce4c39cb22a7940e0cca467c7b19bf358d73ed6664c007650a'
            'c25f14061dc8563dbcd7fefb688087dbeafc7a2f842848a2fcc90778018704d0'
            '5b61048334210c62978b05eb289267b61bfce633cce70963b30347bf71cad86e')

package() {
  install -d "$pkgdir/opt/$pkgname"
  # files in the tarball belong to whoever built it; installed files must be root's
  bsdtar --no-same-owner -xf "$srcdir/ScamCallCenter-linux-$pkgver.tar.gz" -C "$pkgdir/opt/$pkgname"
  chmod 755 "$pkgdir/opt/$pkgname/ScamCallCenter.x86_64"
  chmod 644 "$pkgdir/opt/$pkgname/"*.pck "$pkgdir/opt/$pkgname/"*.so "$pkgdir/opt/$pkgname/OKU_BENI.txt"
  install -Dm755 "$srcdir/do-not-redeem.sh" "$pkgdir/usr/bin/do-not-redeem"
  install -Dm644 "$srcdir/do-not-redeem.desktop" "$pkgdir/usr/share/applications/do-not-redeem.desktop"
  install -Dm644 "$srcdir/do-not-redeem.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/do-not-redeem.svg"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
