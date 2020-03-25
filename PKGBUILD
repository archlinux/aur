# Maintainer:  Caleb Maclennan <caleb@alerque.com>
# Contributor: Ankit R Gadiya <git@argp.in>

pkgname=ufo2otf-git
pkgver=0.2.2
pkgrel=1
pkgdesc='Take UFO font sources and generate OTF’s and webfonts'
arch=('any')
url="https://github.com/fonts/${pkgname%-git}"
provides=("${pkgname%-git}")
conflicts=("${provides[@]}")
depends=('python'
         'fontforge'
         'afdko')
makedepends=('git'
             'python-setuptools')
license=('BSD')
source=("git+$url.git"
        'python3.patch')
sha256sums=('SKIP'
            '152396362fb91765a7a34958d24ca521a804df3ade5f0cce27135dfb1c712d62')

pkgver() {
    cd "${pkgname%-git}"
    git tag | grep -Fq 'v0.2.2' || git tag v0.2.2 9025ba292c2a17e7dc8010c4fed79ab1a036403a
    git describe --tags --abbrev=7 --match="v*" HEAD | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "${pkgname%-git}"
    python setup.py -q install --root="$pkgdir" --optimize=1
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname"/LICENSE
}
