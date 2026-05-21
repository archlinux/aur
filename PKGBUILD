# Maintainer: Marley <warburtonmarley@proton.me>
pkgname=fastflowlm-gtk
pkgver=1.6.8
pkgrel=1
pkgdesc="A minimalist, modern desktop interface for FastFlowLM, built with GTK 4 and Libadwaita."
arch=('any')
url="https://github.com/marleylinux/FastFlowLM-GTK"
license=('MIT')
depends=('python' 'python-gobject' 'gtk4' 'libadwaita' 'libsoup3' 'gtksourceview5' 'python-psutil' 'fastflowlm')
source=("fastflowlm-gtk.desktop"
        "flm-gtk.webp"
        "app.py"
        "main.py"
        "flm.py"
        "utils.py"
        "ui.py"
        "sessions.py"
        "network.py"
        "theme.py"
        "handlers.py"
        "models.py"
        "display.py")
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

package() {
  # Install Python files
  install -d "$pkgdir/usr/share/fastflowlm-gtk"
  install -m644 "$srcdir/"*.py "$pkgdir/usr/share/fastflowlm-gtk/"
  chmod 755 "$pkgdir/usr/share/fastflowlm-gtk/app.py"

  # Install Icon
  install -Dm644 "$srcdir/flm-gtk.webp" "$pkgdir/usr/share/icons/hicolor/256x256/apps/fastflowlm-gtk.png"

  # Install Desktop file
  install -Dm644 "$srcdir/fastflowlm-gtk.desktop" "$pkgdir/usr/share/applications/fastflowlm-gtk.desktop"

  # Create executable wrapper
  install -d "$pkgdir/usr/bin"
  cat <<EOF > "$pkgdir/usr/bin/fastflowlm-gtk"
#!/bin/sh
export PYTHONPATH="/usr/share/fastflowlm-gtk:\$PYTHONPATH"
exec python /usr/share/fastflowlm-gtk/app.py "\$@"
EOF
  chmod +x "$pkgdir/usr/bin/fastflowlm-gtk"
}
