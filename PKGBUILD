# Maintainer: Mehmet Efe Kuzu (Mefkuz) <mefkuz@mefkuz.com>
pkgname=scholarflow
pkgver=1.1.0
pkgrel=4
pkgdesc="Google Gemini destekli, modern tasarımlı yerel akademik asistan (GUI Sürümü)"
arch=('any')
url="https://github.com/mefkuz/scholarflow-gui"
license=('MIT')
depends=('nodejs' 'python-pywebview')
makedepends=('npm' 'git')
source=("git+https://github.com/mefkuz/scholarflow-gui.git"
        "scholarflow-gui"
        "scholarflow.desktop")
md5sums=('SKIP' 'SKIP' 'SKIP')

build() {
  cd "$srcdir/ScholarFlow"
  npm install
  npm run build
}

package() {
  cd "$srcdir/ScholarFlow"
  
  # Web dosyaları (dist klasörü)
  install -d "$pkgdir/usr/share/webapps/$pkgname"
  cp -r dist/* "$pkgdir/usr/share/webapps/$pkgname/"
  
  # GUI Başlatıcı
  install -Dm755 "$srcdir/scholarflow-gui" "$pkgdir/usr/bin/scholarflow-gui"
  
  # Masaüstü dosyası ve İkon
  install -Dm644 "$srcdir/scholarflow.desktop" "$pkgdir/usr/share/applications/scholarflow.desktop"
  install -Dm644 "src/assets/logo.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/scholarflow.png"
}
