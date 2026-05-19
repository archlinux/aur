pkgname=osu-fetch
pkgver=1.0.0
pkgrel=3
pkgdesc="A sleek, CLI fetch tool for osu! player statistics"
arch=('any')
url="https://github.com/test2793/osu-fetch"
license=('MIT')
depends=('python' 'python-requests')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/test2793/osu-fetch/archive/refs/tags/v${pkgver}.tar.gz"
        "osu-fetch.sh")
sha256sums=('8de106388615341c470c2bccaa572b3d2af0a5a0276a8892f2ccca0aca09997a'
            'a5dff6b37bebe2780ab8ae035db5b6baf4fadd63ca25242cbdc65542eadbb25b')

package() {
    install -d "${pkgdir}/usr/share/osu-fetch"
    install -d "${pkgdir}/usr/bin"
    
    # 1. Ищем osufetch.py глубоко внутри архива и копируем
    find "${srcdir}" -name "osufetch.py" -exec install -m644 {} "${pkgdir}/usr/share/osu-fetch/osufetch.py" \;
    
    # 2. А скрипт osu-fetch.sh берем прямо из корня src/ без всяких звездочек!
    install -m755 "${srcdir}/osu-fetch.sh" "${pkgdir}/usr/bin/osu-fetch"
}

