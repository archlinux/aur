# Maintainer: mehmetbayoglu <mehmetbayoglu@users.noreply.github.com>
pkgname=ollama-gui
pkgver=0.2.0
pkgrel=1
pkgdesc="Native Tk/ttkbootstrap Ollama desktop UI with sessions, auto web search, and live theme customization"
arch=('any')
url="https://github.com/mehmetbayoglu/Ollama-gui"
license=('Apache-2.0')
depends=('python' 'tk' 'python-ttkbootstrap')
optdepends=('ollama: local Ollama server to connect to')
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/mehmetbayoglu/Ollama-gui/archive/refs/tags/v$pkgver.tar.gz"
)
sha256sums=('68f61359277d7efab7d7568600a220daf1c1f3bb44e16cb460dc6fd04f54ed2e')

package() {
    _srcdir="$(find "$srcdir" -maxdepth 1 -type d -name 'Ollama-gui*' | head -n 1)"
    cd "$_srcdir"

    # Main script and launcher
    install -Dm755 "ollama-gui"    "$pkgdir/usr/bin/ollama-gui"
    install -Dm644 "ollama_gui.py" "$pkgdir/usr/share/ollama-gui/ollama_gui.py"

    # Desktop entry (generated, not in upstream source)
    install -dm755 "$pkgdir/usr/share/applications"
    cat > "$pkgdir/usr/share/applications/ollama-gui.desktop" <<EOF
[Desktop Entry]
Name=Ollama GUI
Comment=Native Tk/ttkbootstrap Ollama desktop UI
Exec=ollama-gui
Icon=ollama-gui
Terminal=false
Type=Application
Categories=Utility;Office;
Keywords=ollama;ai;llm;chat;
EOF

    # License
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/ollama-gui/LICENSE"
}
