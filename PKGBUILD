# Maintainer: Frederik “Freso” S. Olesen <freso.dk@gmail.com>
# Contributor: wahrwolf <wahrwolf[ät]wolfpit.net
# Contributor: MayeulC

_pkgname=hb-downloader
pkgname=$_pkgname-git
pkgver=0.40.beta.r77.gebbc912
pkgrel=2
pkgdesc="Unofficial tool and library for downloading bundles from Humble Bundle"
arch=('any')
url='https://github.com/talonius/hb-downloader'
license=('MIT')
depends=('python' 'python-requests' 'python-pyaml')
makedepends=('git' 'python-setuptools')
provides=($_pkgname)
conflicts=($_pkgname)
options=(!emptydirs)
source=("git+$url.git")
b2sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
    cd "$_pkgname"
    python setup.py build
}

## Tests seems to currently be broken/non-isolated upstream? FIXME later.
#check() {
#    cd "$_pkgname"
#    python setup.py test
#}

package() {
    cd "$_pkgname"
    install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname/"
    install -Dm 644 README.md hb-downloader-settings.example.yaml -t "$pkgdir/usr/share/doc/$_pkgname/"
    install -Dm 755 hb-downloader.py -T "$pkgdir/usr/bin/hb-downloader"

    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
