# Maintainer: dr460nf1r3 <dr460nf1r3@garudalinux.org>

pkgname=whoogle-git
pkgver=0.3.1
pkgrel=1
pkgdesc='A self-hosted, ad-free, privacy-respecting metasearch engine'
arch=(x86_64 aarch64)
url="https://github.com/benbusby/whoogle-search"
license=(MIT)
depends=(python)
makedepends=(git)
source=("git+$url.git"
        whoogle.service)
sha256sums=('SKIP'
            'e803c743ab610beea9d2d780b0b06ee452952faf6d580fce1b94845f11e41c27')
install=whoogle.install

build() {
  cd whoogle-search
  python3 -m venv venv
  source venv/bin/activate
  pip install -r requirements.txt
}

package() {
 install -Dvm644 "$srcdir/whoogle.service" "$pkgdir/lib/systemd/system/whoogle.service"
 cp -r "$srcdir/whoogle-search" "$pkgdir/opt/"
}
