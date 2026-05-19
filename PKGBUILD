pkgname=osu-fetch
pkgver=1.0.0
pkgrel=10
pkgdesc="A stylish fetch utility for osu! players"
arch=('any')
url="https://github.com/test2793/osu-fetch"
license=('MIT')
depends=('python' 'python-requests')
# Указываем гит-репозиторий как источник. makepkg сам скачает всё начисто.
source=("git+https://github.com/test2793/osu-fetch.git"
        "osu-fetch.sh")
# Для гит-ссылок хэш всегда SKIP, а для локального скрипта оставляем твой проверенный хэш
sha256sums=('SKIP'
            'a5dff6b37bebe2780ab8ae035db5b6baf4fadd63ca25242cbdc65542eadbb25b')

package() {
    install -d "${pkgdir}/usr/share/osu-fetch"
    install -d "${pkgdir}/usr/bin"

    # Ищем osufetch.py внутри склонированного репозитория и копируем его
    find "${srcdir}/osu-fetch" -name "osufetch.py" -exec install -m644 {} "${pkgdir}/usr/share/osu-fetch/osufetch.py" \;

    # Копируем bash-скрипт запуска из корня сборки
    install -m755 "${srcdir}/osu-fetch.sh" "${pkgdir}/usr/bin/osu-fetch"
}
