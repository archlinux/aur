# Maintainer: Zhuoyun Wei <wzyboy@wzyboy.org>

pkgname=fulcrum-bin
_pkgname=fulcrum
pkgdesc='A fast & nimble SPV server for Bitcoin Cash - binary version'
pkgver=1.12.0
pkgrel=1
url='https://github.com/cculianu/Fulcrum'
arch=('x86_64')
license=('GPL3')
backup=('etc/fulcrum.conf')
provides=("$_pkgname")
source=(
  "https://github.com/cculianu/Fulcrum/releases/download/v$pkgver/Fulcrum-$pkgver-x86_64-linux.tar.gz"
  "https://github.com/cculianu/Fulcrum/raw/master/contrib/rpm/fulcrum.service"
  "fulcrum.sysusers.conf"
  "fulcrum.tmpfiles.conf"
)
sha256sums=('94cdc1884a20732830f9171567ab1380c79cb8a2f1c00fbd5fe4c321ee6529bc'
            'f10cccae623e157e333c4b345002e0702891ef17c4560c652641461cdc646add'
            'ce1669d7de840e49338f4edce65668998af68ccbf2e3ab043cc332a2f75172b9'
            'f6e8b786cc4fa9b9c6051959522591a5ef019b1b3e3dacbd8207ccde3e7cdb6a')

package() {
  pushd "$srcdir/Fulcrum-$pkgver-x86_64-linux"
  # Main binaries
  # Author says it's okay to rename the capital F to lowercase f.
  # https://github.com/cculianu/Fulcrum/blob/dc56ff0cbf8db8f9c3afaaf112725af6c141175c/README.md?plain=1#L219-L221
  install -Dm775 "Fulcrum" "$pkgdir/usr/bin/fulcrum"
  install -Dm775 "FulcrumAdmin" "$pkgdir/usr/bin/fulcrum-admin"
  # Example config
  install -Dm644 "fulcrum-example-config.conf" "$pkgdir/etc/fulcrum.conf"
  # Man page
  install -Dm644 "man/Fulcrum.1" "$pkgdir/usr/share/man/man1/fulcrum.1"
  # systemd stuff
  install -Dm644 ../fulcrum.service -t "$pkgdir/usr/lib/systemd/system/"
  install -Dm644 ../fulcrum.sysusers.conf "$pkgdir/usr/lib/sysusers.d/fulcrum.conf"
  install -Dm644 ../fulcrum.tmpfiles.conf "$pkgdir/usr/lib/tmpfiles.d/fulcrum.conf"
}
