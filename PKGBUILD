# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname=lazylibrarian
pkgver=1.7.0
pkgrel=2
pkgdesc="Automatic Book Downloading via NZBs & Torrent"
arch=('any')
url="https://gitlab.com/LazyLibrarian/LazyLibrarian/"
license=('GPL3')
depends=('python'
         'python-unrardll'
         'python-apprise'
         'python-pyopenssl'
         'python-gobject')
conflicts=('lazylibrarian-git')
provides=('lazylibrarian')
install='lazylibrarian.install'
options=(!strip)
source=("https://gitlab.com/LazyLibrarian/LazyLibrarian/-/archive/${pkgver}/LazyLibrarian-${pkgver}.tar.bz2"
        'lazylibrarian.service'
        'lazylibrarian.tmpfiles'
        'lazylibrarian.sysusers')

sha256sums=('a29b6592396fa43c11311336a9dcb126a0da3417f1c0b261d9394bce0a023920'
            '6963070cf23093213fc1230f1786a085f2d8e0f0cc8a206f72df23f7bd6b82a7'
            '4eaf3c7d983b8a8bbf2dc0b7d0430a2ac0e11ceb7f9344c8ea5c20cd6d20f67e'
            '1e5ee6265af4e4d8beea3cec49cbdba6624a6169edee081aa03de32965d4729d')

package() {
  install -d -m 755 "${pkgdir}/usr/lib/lazylibrarian"
  cp -dpr --no-preserve=ownership "${srcdir}/LazyLibrarian-${pkgver}"/* "${pkgdir}/usr/lib/lazylibrarian"

  install -D -m 644 "${srcdir}/lazylibrarian.service" "${pkgdir}/usr/lib/systemd/system/lazylibrarian.service"
  install -D -m 644 "${srcdir}/lazylibrarian.sysusers" "${pkgdir}/usr/lib/sysusers.d/lazylibrarian.conf"
  install -D -m 644 "${srcdir}/lazylibrarian.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/lazylibrarian.conf"
}
