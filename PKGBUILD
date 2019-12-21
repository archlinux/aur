# Maintainer: Alexander Sulfrian <asulfrian@zedat.fu-berlin.de>
pkgname=octoprint-metadata-preprocessor
_reponame=OctoPrint-MetadataPreprocessor
pkgver=0.2.0
pkgrel=1
pkgdesc="GCode preprocessor to generate metadata for octoprint"
arch=('any')
url="https://github.com/malnvenshorn/OctoPrint-MetadataPreprocessor"
license=('AGPL3')
depends=('python2' 'python2-click>=7' 'python2-yaml')
makedepends=('python2-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/malnvenshorn/$_reponame/archive/analysis-$pkgver.tar.gz")
sha256sums=('afe611eae1d63fc046ed02c5f6318ee9d29f7576d731369c08372caf9f33d62d')

build() {
    cd "$srcdir/$_reponame-analysis-$pkgver/analysis/"
    python2 setup.py build
}

package() {
    cd "$srcdir/$_reponame-analysis-$pkgver/analysis/"
    python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build

    mv "$pkgdir/usr/bin/analysis" "$pkgdir/usr/bin/$pkgname"
}
