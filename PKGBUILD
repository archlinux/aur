# Maintainer: Felipe Alfonso Gonzalez <f.alfonso@res-ear.ch>
pkgname=profilex
pkgver=0.0.2
pkgrel=1
pkgdesc="ProFileX is a Linux file management tool with a Qt-based GUI."
arch=('x86_64')
url="https://github.com/felipealfonsog/ProFileX"
license=('BSD')
depends=('gcc' 'qt5-base')

source=("https://github.com/felipealfonsog/ProFileX/archive/refs/tags/v.${pkgver}.tar.gz")

sha256sums=('7192de2452e54a574ae811c14fbdb8f9babe068d6e75b247f0f64ecf78c30394')

build() {
  cd "$srcdir/ProFileX-${pkgver}"
  
  # Run qmake to generate Makefile based on proFileX.pro
  qmake proFileX.pro
  
  # Compile the project using make
  make
}

package() {
  cd "$srcdir/ProFileX-${pkgver}"
  
  # Install the executable to the package directory
  install -Dm755 build/proFileX "$pkgdir/usr/bin/proFileX"
  
  # Install license and README
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  
  # Create desktop entry
  cat <<EOF > "$pkgdir/usr/share/applications/proFileX.desktop"
[Desktop Entry]
Version=1.0
Type=Application
Name=ProFileX
Comment=A Linux file management tool with a Qt-based GUI
Exec=proFileX
Icon=applications-utilities
Terminal=false
Categories=Utility;
EOF
}

