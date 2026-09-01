# Maintainer: MaksSuRitik <твоя_почта@example.com>
pkgname=caelestia-equalizer
pkgver=1.0.0
pkgrel=6
pkgdesc="Standalone Wayland Music Widget for Hyprland with EQ and MPRIS support"
arch=('any')
url="https://github.com/MaksSuRitik/caelestia-equalizer"
license=('GPL3')

depends=(
    'python'
    'python-pyqt6'
    'qt6-declarative'
    'qt6-svg'
    'easyeffects'
    'lsp-plugins'
    'imagemagick'
    'jq'
    'curl'
    'playerctl'
    'wireplumber'
)

source=("git+https://github.com/MaksSuRitik/caelestia-equalizer.git")
md5sums=('SKIP')

package() {
    cd "$srcdir/caelestia-equalizer"

    install -dm755 "$pkgdir/usr/share/$pkgname"
    cp -r media ui main.py README.md "$pkgdir/usr/share/$pkgname/"

    chmod +x "$pkgdir/usr/share/$pkgname/media/art_fetch.sh"
    chmod +x "$pkgdir/usr/share/$pkgname/media/equalizer.sh"

    install -dm755 "$pkgdir/usr/bin"
    echo '#!/bin/bash' > "$pkgdir/usr/bin/$pkgname"
    echo "python /usr/share/$pkgname/main.py \"\$@\"" >> "$pkgdir/usr/bin/$pkgname"
    chmod +x "$pkgdir/usr/bin/$pkgname"

    install -dm755 "$pkgdir/usr/share/applications"
    cat > "$pkgdir/usr/share/applications/$pkgname.desktop" <<EOF
[Desktop Entry]
Name=Caelestia Equalizer
Comment=Hyprland Music Player Widget
Exec=$pkgname
Icon=multimedia-audio-player
Type=Application
Categories=AudioVideo;Audio;Player;
Terminal=false
EOF
}
