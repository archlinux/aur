options=('!debug')
pkgname=violet-launcher
pkgver=1.0.2
pkgrel=1
pkgdesc="Custom Minecraft Launcher with optimized RAM settings"
arch=('any')
url="https://github.com/youruser/violet-launcher"
license=('GPL')
depends=('python' 'python-customtkinter' 'python-pillow' 'python-requests'
makedepends=('pyinstaller')

# Список всех твоих файлов, чтобы makepkg их увидел
source=("main.py" "gui.py" "logic.py" "optimization.py" "settings_frame.py" "console_window.py" "icon.png" "violet-launcher.desktop")
sha256sums=('b385c04c1d0fc19c4238e8532e9e5bc13a04cda131002fb62e41387f9be3d536'
            '05f428ad0afca5515021d8ee78dc6283a6351555ad539089bca47279dd842392'
            'f989218b5f5bee6e1e544da484d857d4cdd64a84445f278ae5f595939b3c84de'
            '8f63743497edca4ca8eec54f4497bf8d35b01dbb2952adfeb31f9ba50ac0ca38'
            '0a9ea37b3e5852e4edd018d985897c46a54ff721cf1e37f9490df47e10ca2899'
            '995926119a3d1cc8a4799a6952e96880ec6f0a895e4ed88dd7344c7ea30fad19'
            'eaece251c53b17033aabd792241c4e4e60399dce2cf9cb8724c6be39ea595140'
            '168d3490158e5a16fa8a2d845053230853608457632daf90e85053c2ad7fac83')

build() {
  cd "$srcdir"
  # Собираем один файл лаунчера с помощью PyInstaller
  pyinstaller --noconfirm --onefile --windowed --icon "icon.png" --add-data "icon.png:." main.py
}

package() {
  cd "$srcdir"

  # 1. Кладём сам лаунчер в системную папку /usr/bin/
  install -Dm755 "dist/main" "${pkgdir}/usr/bin/violet-launcher"

  # 2. Кладём иконку-ракету, чтобы система её нашла
  install -Dm644 "icon.png" "${pkgdir}/usr/share/pixmaps/violet-launcher.png"

  # 3. Кладём ярлык в меню приложений
  install -Dm644 "violet-launcher.desktop" "${pkgdir}/usr/share/applications/violet-launcher.desktop"
}
