# Maintainer: Crazygiscool <crazygiscool@proton.me>
# This -bin package installs prebuilt release binaries from GitHub.
# It is kept in sync with releases via the release CI (scripts/update_aur.sh).

pkgname=lumen-journal-bin
_pkgname=lumen
pkgver=4.0.4
pkgrel=1
pkgdesc="Private, encrypted Markdown journal (prebuilt binary)"
arch=('x86_64')
url="https://github.com/Crazygiscool/Lumen"
license=('custom:Lumen Non-Commercial Software License v1.0')
depends=('gtk3' 'libsecret' 'glib2' 'gcc-libs' 'xz')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=(
  "https://github.com/Crazygiscool/Lumen/releases/download/v${pkgver}/Lumen-linux-v${pkgver}.tar.gz"
  "lumen.desktop"
  "LICENSE"
)
sha256sums=(
  'SKIP'
  'b03658f40f4862e8aa5f85a3a7c9ee82755dd404cb8a13d67d18d27ef27fe386'
  '803e636ca4e95c03158b850c4b1621ba8f1fe620331e38dadc3a46f3d1d1064b'
)

package() {
    cd "$srcdir"

    # Install the Flutter bundle into /opt/lumen
    install -d "$pkgdir/opt/lumen"
    cp -a bundle/* "$pkgdir/opt/lumen/"

    # Launch wrapper: /usr/bin/lumen -> /opt/lumen/lumen
    install -d "$pkgdir/usr/bin"
    ln -sf /opt/lumen/lumen "$pkgdir/usr/bin/lumen"

    # Desktop entry
    install -Dm644 "$srcdir/lumen.desktop" \
        "$pkgdir/usr/share/applications/lumen.desktop"

    # License
    install -Dm644 "$srcdir/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
