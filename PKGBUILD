# Maintainer: wahrwolf <wahrwolf[ät]wolfpit.net
# Contributor: MayeulC

pkgname=hb-downloader
pkgver=0.5.0h
pkgrel=7
pkgdesc="An unofficial library for querying the Humble Bundle API"
arch=('any')
url="https://github.com/saik0/humblebundle-python"
license=('MIT')
depends=('python-requests' 'python-pyaml')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("$pkgname-$pkgver::https://github.com/wahrwolf/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('941ee284114b48aca690896913c3bf631ac346cd481db83825edd192c482887f')

build() {
    cd "$pkgname-$pkgver"
    python setup.py build
    python setup.py test
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
    install -Dm 644 hb-downloader-settings.yaml -T "$pkgdir/etc/hb_downloader.yaml"
    install -Dm 755 hb-downloader.py -T "$pkgdir/usr/bin/hb_downloader"

    python setup.py install --root="$pkgdir/" 
}
