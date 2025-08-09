# Привет, Даник! Это PKGBUILD файл. Он говорит makepkg, как собрать пакет для Arch Linux.

# Информация о пакете
pkgname=daniella-browser
pkgver=1.0.0
pkgrel=1
pkgdesc="A simple web browser built with PyQt6"
arch=('any') # 'any' означает, что он работает на любой архитектуре
url="https://include-digital.org/browser"
license=('GPLv3')
depends=('python-pyqt6' 'python-pyqt6-webengine' 'python-pyqt6-sip' 'python-packaging' 'python-ply' 'python-flit-core')

# Источники. Тут мы указываем, откуда брать файлы.
# В нашем случае это твой main.py и новый desktop-файл.
source=(main.py browser.desktop)
# ==> ПОЧЕМУ ПРОИСХОДИТ СБОЙ? <==
# Файлы на твоем компьютере отличаются от тех, которые я использовал.
# Чтобы это исправить, выполни в терминале команду `updpkgsums` в этой папке.
# Она автоматически обновит SHA256 сумму на правильную.
sha256sums=('248789753d4d3608393de05c20bf1cf16aea56b41a80491bac3db43ad4cca214'
            '834402870a9dd20f08ca45e4147638e55cb38a701b365c518bf96c33e84a6fc2')

# Функция для сборки пакета (в нашем случае она пустая, так как собирать нечего)
build() {
  echo "Сборка не требуется, просто копируем файл."
}

# Функция для установки пакета
package() {
  # Создаём папку для бинарников
  install -d "${pkgdir}/usr/bin"
  
  # Копируем твой main.py и даём ему права на запуск
  install -m755 main.py "${pkgdir}/usr/bin/main.py"

  # Создаём папку для desktop-файлов
  install -d "${pkgdir}/usr/share/applications/"
  
  # Копируем desktop-файл и устанавливаем его
  install -m644 browser.desktop "${pkgdir}/usr/share/applications/daniella-browser.desktop"
}
