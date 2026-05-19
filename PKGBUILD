# Maintainer: Marley <marley@example.com>
pkgname=fastflowlm-gtk
pkgver=3.1.0
pkgrel=1
pkgdesc="A minimalist, modern desktop interface for FastFlowLM, built with GTK 4 and Libadwaita."
arch=('any')
url="https://github.com/marleylinux/FastFlowLM-GTK"
license=('MIT')
depends=('python' 'python-gobject' 'gtk4' 'libadwaita' 'libsoup3' 'gtksourceview5' 'python-psutil' 'fastflowlm')
source=("fastflowlm-gtk.desktop"
        "flm-gtk.png"
        "app.py"
        "main.py"
        "flm.py"
        "utils.py")
sha256sums=('a1cb338b37b7eef0b3824faf4fd622ec9cb4cef26e975bd7bbf9464bd8ff240b'
            'fd6abca67c9170a7795c66c0bf46c9b111a612a930ffae9dd05defeecbbe8c4e'
            '71b15ffa83eb4403d40a9a4c7faac38c1fb37d2594c45b86f9716f20efe6b6f0'
            'e7ad07e9b5cc3e6c89c91ce4a6ec732a8d92b1a46d014d8328a20c71b3332246'
            'a402d09de88b74929723ff7367c58dd05aba4f12ff8c9711fae70476de9734e3'
            'f359d5e2b5d03268ab4fdbedb85c3ea208199c007d2c355f5e445ed6c5de0441')

package() {
  # Install Python files
  install -d "$pkgdir/usr/share/fastflowlm-gtk"
  install -m644 "$srcdir/app.py" "$pkgdir/usr/share/fastflowlm-gtk/"
  install -m644 "$srcdir/main.py" "$pkgdir/usr/share/fastflowlm-gtk/"
  install -m644 "$srcdir/flm.py" "$pkgdir/usr/share/fastflowlm-gtk/"
  install -m644 "$srcdir/utils.py" "$pkgdir/usr/share/fastflowlm-gtk/"

  # Install Icon
  install -Dm644 "$srcdir/flm-gtk.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/fastflowlm-gtk.png"

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
