pkgname=ollama-gui
pkgver=0.1.0
pkgrel=1
pkgdesc="Native Tk/ttkbootstrap Ollama desktop UI with sessions and auto web search"
arch=('any')
depends=('python' 'tk' 'python-ttkbootstrap')
license=('Apache-2.0')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mehmetbayoglu/Ollama-gui/archive/refs/heads/main.tar.gz")
sha256sums=('SKIP')

build() {
  :
}

package() {
  # GitHub archives extract to a directory named after the repo and ref (e.g., Ollama-gui-main or Ollama-gui-<commit>).
  _srcdir="$(find "$srcdir" -maxdepth 1 -type d -name 'Ollama-gui*' | head -n 1)"
  cd "$_srcdir"

  install -Dm755 "ollama-gui" "$pkgdir/usr/bin/ollama-gui"
  install -Dm644 "ollama_gui.py" "$pkgdir/usr/share/ollama-gui/ollama_gui.py"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/ollama-gui/LICENSE"

  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/ollama-gui.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=Ollama GUI
Comment=Native Ollama desktop client
Exec=/usr/bin/ollama-gui
Icon=utilities-terminal
Terminal=false
Categories=Utility;
EOF
}
