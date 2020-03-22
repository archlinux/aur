# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname=lazylibrarian
pkgver=1.7.2
pkgrel=1
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

sha256sums=('273609715e409da9fb422ec846e03b8959e11f745c15523a27a9aff6e63722c4'
            '6963070cf23093213fc1230f1786a085f2d8e0f0cc8a206f72df23f7bd6b82a7'
            '02f5a617eb591440188939e1aa047fa81d9f4382e8f7f444113b1127ef64156f'
            '1e5ee6265af4e4d8beea3cec49cbdba6624a6169edee081aa03de32965d4729d')

package() {
  install -d -m 755 "${pkgdir}/usr/lib/lazylibrarian"
  cp -dpr --no-preserve=ownership "${srcdir}/LazyLibrarian-${pkgver}"/* "${pkgdir}/usr/lib/lazylibrarian"

  install -D -m 644 "${srcdir}/lazylibrarian.service" "${pkgdir}/usr/lib/systemd/system/lazylibrarian.service"
  install -D -m 644 "${srcdir}/lazylibrarian.sysusers" "${pkgdir}/usr/lib/sysusers.d/lazylibrarian.conf"
  install -D -m 644 "${srcdir}/lazylibrarian.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/lazylibrarian.conf"
}
