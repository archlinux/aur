# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname=lazylibrarian
pkgver=1.6.2
pkgrel=1
pkgdesc="Automatic Book Downloading via NZBs & Torrent"
arch=('any')
url="https://github.com/DobyTang/LazyLibrarian"
license=('GPL3')
depends=('python')
conflicts=('lazylibrarian-git')
provides=('lazylibrarian')
install='lazylibrarian.install'

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/DobyTang/LazyLibrarian/archive/${pkgver}.tar.gz"
        'lazylibrarian.service'
        'lazylibrarian.tmpfiles'
        'lazylibrarian.sysusers')

sha256sums=('53741e7c54c7fba6702affb28eb99c290d22b46c846249dfacf6f079571c62ba'
            '6963070cf23093213fc1230f1786a085f2d8e0f0cc8a206f72df23f7bd6b82a7'
            '2e54152e221241d116ed9e63b08718bec41bfb7c6576eccc683c294702b07650'
            '1e5ee6265af4e4d8beea3cec49cbdba6624a6169edee081aa03de32965d4729d')

package() {
  install -d -m 755 "${pkgdir}/usr/lib/lazylibrarian"
  cp -dpr --no-preserve=ownership "${srcdir}/LazyLibrarian-${pkgver}"/* "${pkgdir}/usr/lib/lazylibrarian"

  install -D -m 644 "${srcdir}/lazylibrarian.service" "${pkgdir}/usr/lib/systemd/system/lazylibrarian.service"
  install -D -m 644 "${srcdir}/lazylibrarian.sysusers" "${pkgdir}/usr/lib/sysusers.d/lazylibrarian.conf"
  install -D -m 644 "${srcdir}/lazylibrarian.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/lazylibrarian.conf"
}
