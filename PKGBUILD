# Maintainer: Danta <danta@studio234.id>
pkgname=belinda-ai
pkgver=1.4.7
pkgrel=1
pkgdesc="WhatsApp Bot Belinda AI - Intelligent assistant with GUI setup and cross-platform support"
arch=('any')
url="https://github.com/Danta23/Belinda_AI"
license=('MIT')
depends=('python' 'python-pyqt5' 'python-qtawesome' 'python-dotenv' 'nodejs' 'npm' 'ffmpeg' 'yt-dlp')
makedepends=('git')
source=("belinda-ai.service" 
        "belinda-ai.sh"
        "app.py"
        "handlers.py"
        "bridge.js"
        "package.json"
        "requirements.txt"
        "installer_app.py"
        "installer_styles.py"
        "installer_settings_manager.py"
        "installer_translations.py"
        "start.sh"
        "stop.sh"
        "reset.sh"
        "start.fish"
        "stop.fish"
        "reset.fish")
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

package() {
  # 1. Create directory
  mkdir -p "$pkgdir/opt/$pkgname/installer"
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/lib/systemd/user"

  # 2. Copy main project files
  cp "$srcdir/app.py" "$pkgdir/opt/$pkgname/"
  cp "$srcdir/handlers.py" "$pkgdir/opt/$pkgname/"
  cp "$srcdir/bridge.js" "$pkgdir/opt/$pkgname/"
  cp "$srcdir/package.json" "$pkgdir/opt/$pkgname/"
  cp "$srcdir/requirements.txt" "$pkgdir/opt/$pkgname/"
  
  # 3. Copy installer files
  cp "$srcdir/installer_app.py" "$pkgdir/opt/$pkgname/installer/app.py"
  cp "$srcdir/installer_styles.py" "$pkgdir/opt/$pkgname/installer/styles.py"
  cp "$srcdir/installer_settings_manager.py" "$pkgdir/opt/$pkgname/installer/settings_manager.py"
  cp "$srcdir/installer_translations.py" "$pkgdir/opt/$pkgname/installer/translations.py"

  # 5. Copy shell scripts
  cp "$srcdir/start.sh" "$pkgdir/opt/$pkgname/"
  cp "$srcdir/stop.sh" "$pkgdir/opt/$pkgname/"
  cp "$srcdir/reset.sh" "$pkgdir/opt/$pkgname/"
  cp "$srcdir/start.fish" "$pkgdir/opt/$pkgname/"
  cp "$srcdir/stop.fish" "$pkgdir/opt/$pkgname/"
  cp "$srcdir/reset.fish" "$pkgdir/opt/$pkgname/"

  # 6. Install start script (GUI Launcher)
  install -Dm755 "$srcdir/belinda-ai.sh" "$pkgdir/usr/bin/belinda-ai"

  # 7. Install systemd service
  install -Dm644 "$srcdir/belinda-ai.service" "$pkgdir/usr/lib/systemd/user/belinda-ai.service"
}
