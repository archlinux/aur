# Maintainer: Andersmmg <andersmmg at duck dot com>
pkgname=ark-vcs-bin
pkgver=0.13.7
pkgrel=1
pkgdesc="VCS built from the ground up for performance and ease of use. Pre-compiled."
arch=('x86_64')
url="https://ark-vcs.com/"
license=('custom')
depends=()
optdepends=()
provides=('ark-vcs')
conflicts=('ark-vcs')

source=("ark-vcs.png")
source_x86_64=("https://ark-vcs.com/static/versions/Ark-Vcs_${pkgver//./_}_linux.zip")
sha256sums=("SKIP")
sha256sums_x86_64=('3987f47bfa855b8eba4f0104ad3717cf16146c387a2977a5a7374c8167a884de')

prepare() {
  mv "${srcdir}/Ark-Vcs_${pkgver//./_}" "$srcdir/$pkgname-$pkgver"
  cd "$srcdir/$pkgname-$pkgver"
  cat <<EOF > ark-vcs.desktop
[Desktop Entry]
Name=Ark VCS
Description=VCS built from the ground up for performance and ease of use.
Exec=ark-vcs gui
Icon=/usr/share/icons/hicolor/256x256/apps/$pkgname.png
Terminal=false
Type=Application
Categories=Utility;Development;
StartupWMClass=ark-vcs
EOF
}

package() {
    _output="$srcdir/$pkgname-$pkgver"

    install -Dm755 "${_output}/ark" "${pkgdir}/usr/bin/ark-vcs"

    # Install the .desktop file for launcher integration (if you have one)
    install -d "$pkgdir/usr/share/applications"
    cp "$srcdir/$pkgname-$pkgver/ark-vcs.desktop" "$pkgdir/usr/share/applications/"

    # # Install application icon
    install -d "$pkgdir/usr/share/icons/hicolor/256x256/apps"
    cp "$srcdir/ark-vcs.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"
}
