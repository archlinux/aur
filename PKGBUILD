pkgname=jacket-git
pkgver=1.0.0.r3.2b4114d
pkgrel=1
pkgdesc="Voice-activated soundboard"
arch=('x86_64')
url="https://github.com/GoreliSuhar1/JacketVoice"
license=('MIT')
depends=('python' 'python-sounddevice' 'python-vosk' 'python-pydub' 'python-numpy' 'pipewire')
source=("git+https://github.com/GoreliSuhar1/JacketVoice.git")
sha256sums=('SKIP')

pkgver() {
  cd JacketVoice
  printf "1.0.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    # Создаем директорию для установки
    install -d "$pkgdir/opt/jacket"
    
    # Копируем скрипт запуска, явно указывая путь из src
    # Так как мы находимся в src/ при выполнении, используем путь от него
    install -Dm755 "JacketVoice/jacket_run.sh" "$pkgdir/opt/jacket/jacket_run.sh"
    
    # Копируем остальные файлы проекта
    cp -r JacketVoice/* "$pkgdir/opt/jacket/"
    
    # Создаем симлинк, чтобы команда 'jacket' работала в терминале
    install -d "$pkgdir/usr/bin"
    ln -s /opt/jacket/jacket_run.sh "$pkgdir/usr/bin/jacket"
}
