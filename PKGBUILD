# Maintainer: Mehmet Efe Kuzu (Mefkuz) <mefkuz@mefkuz.com>
pkgname=scholarflow
pkgver=1.1.0
pkgrel=6
pkgdesc="Google Gemini destekli, modern tasarımlı yerel akademik asistan (GUI Sürümü)"
arch=('any')
url="https://github.com/mefkuz/scholarflow-gui"
license=('MIT')
depends=('nodejs' 'python-pywebview')
makedepends=('npm' 'git')
# İsmi çakışmaması için git reposunu 'scholarflow-source' dizinine klonluyoruz
source=("scholarflow-source::git+https://github.com/mefkuz/scholarflow-gui.git")
md5sums=('SKIP')

build() {
  cd "$srcdir/scholarflow-source"
  npm install
  npm run build
}

package() {
  cd "$srcdir/scholarflow-source"
  
  # Web dosyaları (dist klasörü)
  install -d "$pkgdir/usr/share/webapps/$pkgname"
  cp -r dist/* "$pkgdir/usr/share/webapps/$pkgname/"
  
  # GUI Başlatıcı (Repo içindeki dosyayı bin altına kopyalıyoruz)
  install -Dm755 "scholarflow-gui" "$pkgdir/usr/bin/scholarflow-gui"
  
  # Masaüstü dosyası ve İkon
  install -Dm644 "scholarflow.desktop" "$pkgdir/usr/share/applications/scholarflow.desktop"
  install -Dm644 "src/assets/logo.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/scholarflow.png"
}
