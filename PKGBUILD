# Maintainer: Andersmmg <andersmmg at duck dot com>
pkgname=ark-vcs-bin
pkgver=0.13.2
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
sha256sums_x86_64=('c72a948f20c5c9108cb1fcea6186702aad05e8893a267c965e915736cae6cdf8')

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
