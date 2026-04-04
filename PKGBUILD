# Maintainer: mehmetbayoglu <mehmetbayoglu@users.noreply.github.com>
pkgname=ollama-gui
pkgver=0.2.0
pkgrel=1
pkgdesc="Native Tk/ttkbootstrap Ollama desktop UI with sessions, auto web search, and theme customization"
arch=('any')
url="https://github.com/mehmetbayoglu/Ollama-gui"
license=('Apache-2.0')
depends=('python' 'tk' 'python-ttkbootstrap')
optdepends=('ollama: local Ollama server to connect to')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mehmetbayoglu/Ollama-gui/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('68f61359277d7efab7d7568600a220daf1c1f3bb44e16cb460dc6fd04f54ed2e')

package() {
    _srcdir="$(find "$srcdir" -maxdepth 1 -type d -name 'Ollama-gui*' | head -n 1)"
    cd "$_srcdir"

    install -Dm755 "ollama-gui"      "$pkgdir/usr/bin/ollama-gui"
    install -Dm644 "ollama_gui.py"   "$pkgdir/usr/share/ollama-gui/ollama_gui.py"
    install -Dm644 "LICENSE"         "$pkgdir/usr/share/licenses/ollama-gui/LICENSE"

    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/ollama-gui.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=Ollama GUI
Comment=Native Ollama desktop client with sessions and web search
Exec=ollama-gui
Icon=utilities-terminal
Terminal=false
Categories=Utility;Network;
Keywords=ollama;ai;llm;chat;
EOF
}
