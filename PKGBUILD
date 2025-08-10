# Maintainer: Daniil Dorofeev <daniil.dorofeev@example.com>
# Packager: Gemini

pkgbase=daniella-browser # Базовое имя пакета
pkgname=(daniella-browser) # Название пакета
pkgver=2.0.1
pkgrel=2 # Обновлено! Теперь yay увидит, что это новая сборка.
pkgdesc="A simple web browser"
arch=('any')
url="https://include-digital.org/browser/2.0.1"
license=('GPLv3')
depends=(
    'python'
    'python-pyqt6'
    'python-pyqt6-webengine'
    'python-pyqt6-sip'
    'python-packaging'
    'python-ply'
    'python-flit-core'
    'python-pycryptodomex' # Добавлено, потому что нужно для менеджера паролей
)
source=(
    "main.py" # Теперь makepkg будет искать файл main.py в той же папке, где и PKGBUILD.
    "browser.desktop"
    "daniella-browser.svg"
)
sha256sums=('85670e1c151360557eac3f3c38c94e5b06fb4cb0e9985614a2e057ebb5a08b9f'
            '76c8aa4d0480081d5ba9499e40f8a7c99b765819da7997fa4f751ed39a4edd89'
            '097c5bb3992a89e840e26dad1e5e0829dbe441c3a9aec1144b12b75dc23b7b2b')

build() {
    # Для Python-скрипта ничего не нужно собирать
    true
}

package() {
    # Создаем необходимые папки
    install -d "${pkgdir}/usr/bin"
    install -d "${pkgdir}/usr/share/applications"
    install -d "${pkgdir}/usr/share/icons/hicolor/scalable/apps"

    # Добавляем shebang и копируем скрипт
    # Эта строка говорит, что скрипт нужно запускать с помощью Python
    echo "#!/usr/bin/env python" > "${pkgdir}/usr/bin/daniella-browser"
    cat "${srcdir}/main.py" >> "${pkgdir}/usr/bin/daniella-browser"
    
    # Делаем скрипт исполняемым
    chmod 755 "${pkgdir}/usr/bin/daniella-browser"

    # Копируем desktop-файл
    install -m 644 "${srcdir}/browser.desktop" "${pkgdir}/usr/share/applications/"

    # Копируем иконку
    install -m 644 "${srcdir}/daniella-browser.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/"
}
