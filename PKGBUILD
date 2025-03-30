# Maintainer: rickert156@rambler.ru
pkgname=sinpass
pkgver=0.1
pkgrel=1
pkgdesc="Open Source Password Manager"
arch=('any')
url="https://github.com/rickert156/SinPass"
license=('GPL3')
depends=('python' 'python-pip')  # Добавь необходимые зависимости
makedepends=('git' 'python-setuptools')  # Для сборки
source=("$pkgname::git+https://github.com/rickert156/SinPass.git")
sha256sums=('SKIP')  # Пропущено, так как используешь git

	package() {
    cd "$srcdir/$pkgname"

    # Устанавливаем основной скрипт
    install -Dm755 SinPass.py "$pkgdir/usr/bin/sinpass"

    # Получаем точный путь для Python
    python_lib_dir=$(python3 -c "import sys; print(sysconfig.get_paths()['purelib'])")

    # Создаем директорию для установки пакетов, если она не существует
    mkdir -p "$pkgdir$python_lib_dir/sinpass/"

    # Копируем модули в правильную директорию
    cp -r SinCity "$pkgdir$python_lib_dir/sinpass/"
    cp -r module "$pkgdir$python_lib_dir/sinpass/"

    # Установка документации
    install -Dm644 README.md "$pkgdir/usr/share/doc/sinpass/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/sinpass/LICENSE"
}

