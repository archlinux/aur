pkgname=tateditor-bin
pkgver=1.0
pkgrel=1
pkgdesc="TATEditor (GTK3 build, binary release)"
arch=('x86_64')
url="https://drive.google.com/file/d/1nIb3ocWZp7y5NwQt4K_M1F8G_r1YjMdg/view"
license=('custom')
depends=('gtk3')
source=("tateditor.tar.gz::https://drive.google.com/uc?export=download&id=1nIb3ocWZp7y5NwQt4K_M1F8G_r1YjMdg")
sha256sums=('SKIP')

package() {
  # system template files
  install -d "${pkgdir}/usr/share/tateditor"
  cp -r "${srcdir}/tateditor-gtk3-x86_64/"* "${pkgdir}/usr/share/tateditor/"

  # wrapper
  install -d "${pkgdir}/usr/bin"
  cat > "${pkgdir}/usr/bin/tateditor" <<'EOF'
#!/bin/bash
userdir="$HOME/.local/share/tateditor"
if [ ! -d "$userdir" ]; then
  mkdir -p "$userdir"
  cp -r /usr/share/tateditor/* "$userdir/"
fi
cd "$userdir"
exec ./tateditor "$@"
EOF
  chmod +x "${pkgdir}/usr/bin/tateditor"

  # desktop entry
  install -d "${pkgdir}/usr/share/applications"
  cat > "${pkgdir}/usr/share/applications/tateditor.desktop" <<EOF
[Desktop Entry]
Name=TATEditor
Exec=tateditor
Icon=accessories-text-editor
Type=Application
Categories=Utility;TextEditor;
EOF
}

