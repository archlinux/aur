# Maintainer: Jingbei Li <i@jingbei.li>
_pkgname=pinyin-completion
pkgname=$_pkgname-git
pkgver=57.5ec04f7
pkgrel=1
pkgdesc="complete path name based upon the pinyin acronym of Chinese characters"
arch=('any')
url="https://github.com/petronny/pinyin-completion"
license=('GPL3')
depends=('python')
makedepends=('git')
source=("git+https://github.com/petronny/pinyin-completion"
        "pinyin-completion.install")
sha256sums=('SKIP'
            'f6dbcc8fc15c6de71897281f1d64f05df7dfd1e5ec3b1a70bd46a4f3078f9f13')
install='pinyin-completion.install'

pkgver() {
    cd $_pkgname
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
    cd "$srcdir/$_pkgname/tools"
    python table-generator.py > ../pinyin_completion/pinyin_initial.py
}

package() {
    cd $_pkgname

    mkdir -p "$pkgdir/usr/share/$_pkgname/"
    cp -r shell "$pkgdir/usr/share/$_pkgname/"
    cp -r tools "$pkgdir/usr/share/$_pkgname/"

    python setup.py install --root=$pkgdir/ --optimize=1
}
