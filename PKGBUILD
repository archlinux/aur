# Maintainer: atrax <***** at prtn dot email where ***** is atrax> 

pkgname=cmus-syncthing
pkgver=0.7.0
pkgrel=1
pkgdesc="Sync utility for cmus playlists using Syncthing"
arch=('any')
url="https://github.com/atrax-dev/cmus-syncthing"
license=('custom:0BSD')
depends=(python-pyxdg python-setuptools)
optdepends=("cmus: playlist creation"
	    "syncthing: syncing")
install="${pkgname}.install"
source=("https://github.com/atrax-dev/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('b5692e257b0af39c8e65bd9db35a78b99021cfa24eb7b1d14690755c29d1e472')

build() {
  cd "$srcdir"/${pkgname}-${pkgver}
  python setup.py build
}

package() {
  cd "$srcdir"/${pkgname}-${pkgver}
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm 644 README.md -t "$pkgdir"/usr/share/doc/$pkgname
  install -Dm644 share/cmus-syncthing.service -t "$pkgdir"/usr/lib/systemd/user
  install -Dm644 share/cmus-syncthing.timer -t "$pkgdir"/usr/lib/systemd/user
  python setup.py install --root="$pkgdir"
}
