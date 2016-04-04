pkgname=lessmsi
pkgver=1.4
pkgrel=1
pkgdesc='An utility to view and extract the contents of an MSI file'
arch=(any)
url='http://lessmsi.activescott.com'
depends=(winetricks)
makedepends=(gendesk icoutils)
source=(https://github.com/activescott/lessmsi/releases/download/v$pkgver/lessmsi-v$pkgver.zip
        lessmsi)
sha1sums=('3798775e8038e5ae9d1b279cca7df234ee4ca560'
          '6b5308768269d0846104abf83fae3b5aa71b77d1')

prepare() {
  cd $srcdir
  gendesk -f -n --pkgname "$pkgname" --pkgdesc "$pkgdesc" --categories 'Wine'
}

package() {
  cd $srcdir
  install -d $pkgdir/usr/share/$pkgname
  find . ! -name lessmsi-v$pkgver.zip \
         ! -name lessmsi.desktop \
         ! -name lessmsi \
         ! -name . \
      -exec install -m644 -t $pkgdir/usr/share/$pkgname {} +
  install -Dm755 lessmsi $pkgdir/usr/bin/lessmsi
  install -Dm644 lessmsi.desktop $pkgdir/usr/share/applications/lessmsi.desktop
}

