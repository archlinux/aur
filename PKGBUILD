# Mantenedor: ricardocorreaandrade@proton.me
pkgname=electron-deepseek
pkgver=1.0.0
pkgrel=1
pkgdesc="Electron DeepSeek App"
arch=('x86_64')
url="https://github.com/RicardoCA/electron-deepseek"
license=('MIT')
depends=('electron' 'gtk3' 'nss' 'libxss')
makedepends=('npm' 'git' 'nodejs')
source=("git+https://github.com/RicardoCA/electron-deepseek.git")
sha256sums=('SKIP')

prepare() {
  cd "$srcdir/$pkgname"
  npm install
}

package() {
  # Cria o diretório em /opt
  mkdir -p "$pkgdir/opt/$pkgname"
  
  # Copia todos os arquivos necessários
  cp -r "$srcdir/$pkgname"/{assets,node_modules,.git,main.js,package.json,package-lock.json,README.md,.gitignore} "$pkgdir/opt/$pkgname/"
  
  # Cria um script de inicialização para o aplicativo
  mkdir -p "$pkgdir/usr/bin"
  echo '#!/bin/sh' > "$pkgdir/usr/bin/$pkgname"
  echo "cd /opt/$pkgname && npm start --converge /opt/$pkgname" >> "$pkgdir/usr/bin/$pkgname"
  chmod +x "$pkgdir/usr/bin/$pkgname"
  
  # Cria o arquivo .desktop
  mkdir -p "$pkgdir/usr/share/applications"
  echo "[Desktop Entry]
Name=Electron DeepSeek
Comment=Electron DeepSeek App
Exec=$pkgname
Terminal=false
Type=Application
Categories=Utility;
Icon=/opt/$pkgname/assets/icon.png" > "$pkgdir/usr/share/applications/$pkgname.desktop"
}
