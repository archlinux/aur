# Maintainer: wahrwolf <wahrwolf[ät]wolfpit.net
# Contributor: talonius
# Contributor: Brian Schkerke

pkgname=hb-downloader
pkgver=0.5.0h
pkgrel=8
pkgdesc="An unofficial library for querying the Humble Bundle API"
arch=('any')
url="https://github.com/talonius/hb-downloader"

commit="ebbc91293c4acfc158be2100689632620fb60e50"

license=('MIT')
depends=('python-requests' 'python-pyaml')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("$pkgname-$pkgver::https://github.com/talonius/hb-downloader/archive/$commit.zip")
sha256sums=('f11be30faaff16d31f06b07b72eecb35cb57195413b8ec4b88a552621b66d6c1')

prepare() {
    cd "$pkgname-$commit"
    cp hb-downloader-settings.example.yaml hb-downloader-settings.yaml
}

build() {
    cd "$pkgname-$commit"
    python setup.py build
}

package() {
    cd "$pkgname-$commit"
    install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
    install -Dm 644 hb-downloader-settings.yaml -T "$pkgdir/etc/hb_downloader.yaml"
    install -Dm 755 hb-downloader.py -T "$pkgdir/usr/bin/hb-downloader"

    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
