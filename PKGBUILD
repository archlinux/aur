# Maintainer: SMA <helwanlinux@gmail.com>

pkgname=helwan-ai-gate
pkgver=1.0.0
pkgrel=1
pkgdesc="Helwan AI Gate - بوابة Electron ذكية للذكاء الاصطناعي"
arch=('any')
url="https://github.com/helwan-linux/helwan-ai"
license=('MIT')
depends=('electron')
makedepends=('git' 'npm')
source=("$pkgname::git+https://github.com/helwan-linux/helwan-ai.git#branch=main")
md5sums=('SKIP')

package() {
  cd "$srcdir/$pkgname/helwan-ai-gate"

  # نسخ ملفات التطبيق
  install -d "$pkgdir/usr/lib/$pkgname"
  cp -r src/* "$pkgdir/usr/lib/$pkgname"

  # تثبيت الأيقونة
  install -Dm644 src/ai.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/$pkgname.png"

  # ملف desktop
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$pkgname.desktop" <<EOF
[Desktop Entry]
Version=1.0
Name=Helwan AI Gate
Comment=بوابتك الذكية إلى أدوات الذكاء الاصطناعي
Exec=$pkgname
Icon=$pkgname
Terminal=false
Type=Application
Categories=Utility;AI;
EOF

  # سكريبت التشغيل
  install -d "$pkgdir/usr/bin"
  echo "#!/bin/bash
electron /usr/lib/$pkgname" > "$pkgdir/usr/bin/$pkgname"
  chmod +x "$pkgdir/usr/bin/$pkgname"
}

