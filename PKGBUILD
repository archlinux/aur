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

    # Установка основного скрипта
    install -Dm755 SinPass.py "$pkgdir/usr/bin/sinpass"
    
    # Установка зависимостей
    cd "$srcdir/$pkgname"
    python3 -m pip install --root="$pkgdir" --prefix=/usr --no-warn-script-location .

    # Установка дополнительных папок и файлов
    install -Dm644 README.md "$pkgdir/usr/share/doc/sinpass/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/sinpass/LICENSE"

    # Установка модулей
    cp -r SinCity "$pkgdir/usr/lib/python3.*/site-packages/sinpass/"
    cp -r module "$pkgdir/usr/lib/python3.*/site-packages/sinpass/"

    # Если есть другие модули, можно добавить аналогичные команды
}
