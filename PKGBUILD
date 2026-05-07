# Maintainer: Lenvora
pkgname=ydm-git
pkgver=1.0.0
pkgrel=1
pkgdesc="YouTube Download Manager by Lenvora"
arch=('any')
url="https://github.com/lenvora/YDM"
license=('MIT')
depends=('pyside6' 'yt-dlp' 'python')
source=("git+https://github.com/lenvora/YDM.git")
md5sums=('SKIP')

package() {
  cd "$srcdir/YDM"
  
  # Klasörleri oluştur
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/ydm"
  mkdir -p "$pkgdir/usr/share/pixmaps"
  mkdir -p "$pkgdir/usr/share/applications"
  
  # Kodları ve ikonu kopyala
  cp main.py "$pkgdir/usr/share/ydm/"
  cp icon_2.png "$pkgdir/usr/share/pixmaps/ydm.png"
  
  # Çalıştırma scriptini oluştur (Sistem python'ı ile çalışması için en temizi budur)
  echo -e "#!/bin/bash\npython /usr/share/ydm/main.py \"\$@\"" > "$pkgdir/usr/bin/ydm"
  chmod +x "$pkgdir/usr/bin/ydm"

  # .desktop dosyasını oluştur (Menüde logonun görünmesi için şart!)
  echo -e "[Desktop Entry]\nName=YDM\nComment=YouTube Download Manager\nExec=/usr/bin/ydm\nIcon=ydm\nTerminal=false\nType=Application\nCategories=Network;Video;" > "$pkgdir/usr/share/applications/ydm.desktop"
}
