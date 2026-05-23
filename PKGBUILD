pkgname=planner-app-bin
pkgver=1.2.0
pkgrel=1
pkgdesc="Prebuilt Planner App v1.2 with Habit Dashboard and minimal dependencies"
arch=("x86_64")
url="https://gitflic.ru/project/en3/planner-app"
license=("MIT")

depends=("gtk3" "webkit2gtk-4.1")
makedepends=()
options=("!debug")

# Источник: только бинарник
source=("file:///home/mmm/Downloads/planner-app-1.2.0-linux-x86_64.tar.gz")
sha256sums=("SKIP")

package() {
  cd "$srcdir"

  # Распаковка бинарника
  tar -xzf "planner-app-1.2.0-linux-x86_64.tar.gz"

  # Установка бинарника
  install -Dm755 "planner-app" "${pkgdir}/usr/bin/planner-app"

  # Установка иконки (абсолютный путь)
  install -Dm644 "/home/mmm/planner-app/src-tauri/icons/icon.png" "${pkgdir}/usr/share/pixmaps/planner-app.png"

  # Создание desktop entry
  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/planner-app.desktop" <<EOF
[Desktop Entry]
Name=Planner App
Comment=Planner App with Tasks and Habit Tracker
Exec=planner-app
Icon=planner-app
Terminal=false
Type=Application
Categories=Utility;Office;
StartupNotify=true
EOF
}
