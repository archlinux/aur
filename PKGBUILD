# Maintainer: Diramix <39developer@diram1x.ru>
pkgname=next-music
pkgver=2.3.0
pkgrel=3
pkgdesc="Web client for Yandex Music with support for themes, addons and Discord Rich Presence (RPC)"
arch=('x86_64')
url="https://github.com/Web-Next-Music/Next-Music-Client"
license=('MIT')
depends=('glibc' 'gtk3' 'alsa-lib' 'desktop-file-utils')  # gtk-launch нужен desktop-file-utils
source=("https://github.com/Web-Next-Music/Next-Music-Client/releases/download/Next-Music-${pkgver}/next-music_${pkgver}_amd64.deb")
sha256sums=('SKIP')

package() {
  cd "${srcdir}"

  # Распаковка deb
  ar x "next-music_${pkgver}_amd64.deb"
  tar -xf data.tar.*

  # Устанавливаем usr и opt в pkgdir
  [[ -d usr ]] && cp -r usr "${pkgdir}/"
  [[ -d opt ]] && cp -r opt "${pkgdir}/"

  # Создаём launcher-скрипт в /usr/bin
  mkdir -p "${pkgdir}/usr/bin"
  cat > "${pkgdir}/usr/bin/next-music" <<'EOF'
#!/bin/bash
# Запуск приложения через desktop entry
gtk-launch next-music
EOF

  chmod +x "${pkgdir}/usr/bin/next-music"
}
