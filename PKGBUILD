# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname=lazylibrarian-git
pkgver=r4281.dff36bd8
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
makedepends=('git')
install='lazylibrarian.install'
options=(!strip)
source=('git+https://gitlab.com/LazyLibrarian/LazyLibrarian.git'
        'lazylibrarian.service'
        'lazylibrarian.tmpfiles'
        'lazylibrarian.sysusers')

sha256sums=('SKIP'
            '6963070cf23093213fc1230f1786a085f2d8e0f0cc8a206f72df23f7bd6b82a7'
            '89af84719dfd504f5d05e7a80ec42c17588f1dd5615d194af5a12d5e1034ba1e'
            '1e5ee6265af4e4d8beea3cec49cbdba6624a6169edee081aa03de32965d4729d')

pkgver() {
  cd LazyLibrarian
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -d -m 755 "${pkgdir}/usr/lib/lazylibrarian"
  cp -dpr --no-preserve=ownership "${srcdir}/LazyLibrarian"/* "${pkgdir}/usr/lib/lazylibrarian"
  rm -rf "${pkgdir}/usr/lib/lazylibrarian/.git"
  rm -rf "${pkgdir}/usr/lib/lazylibrarian/LazyLibrarian.app"

  install -D -m 644 "${srcdir}/lazylibrarian.service" "${pkgdir}/usr/lib/systemd/system/lazylibrarian.service"
  install -D -m 644 "${srcdir}/lazylibrarian.sysusers" "${pkgdir}/usr/lib/sysusers.d/lazylibrarian.conf"
  install -D -m 644 "${srcdir}/lazylibrarian.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/lazylibrarian.conf"
}
