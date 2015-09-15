# Maintainer: Nicolas F. <aur@fratti.ch>
pkgname=cum
pkgver=0.1
pkgrel=3
pkgdesc="Comic Updater, Mangafied"
arch=('any')
url="https://github.com/Hamuko/cum"
license=('Apache')
depends=('python-click' 'python' 'python-requests' 'python-sqlalchemy' 
         'python-beautifulsoup4' 'python-natsort')
#install=cum.install
source=("https://github.com/Hamuko/cum/archive/v${pkgver}.tar.gz"
        "0001-ds-scanlators.patch"
        "cumpletion.sh")
options=(!emptydirs)
md5sums=('d782fb9c1e6334e39ecd798e2b97302f'
         'ca2e2b1f82a0b3c2261f03aa0454849f'
         '1820b9b51267fb577480d1b4ce7e92ec')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    patch -p1 -i $srcdir/0001-ds-scanlators.patch
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1

    install -Dm644 $srcdir/cumpletion.sh \
            $pkgdir/usr/share/bash-completion/completions/cum
}
