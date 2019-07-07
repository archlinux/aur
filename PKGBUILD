# Maintainer: Jonathan Haylett <jonathan@haylett.dev>
_pkgbasename=wmctrl-python3
pkgname=$_pkgbasename-git
pkgrel=1
pkgver=0.3
pkgdesc="A tool to programmatically control windows inside X"
arch=('any')
url="https://bitbucket.org/JonnyHaystack/wmctrl-python3"
license=('GPL')
depends=('python')
source=(git+https://bitbucket.org/JonnyHaystack/wmctrl-python3)
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgbasename"
    git tag -l --sort=-v:refname | head -n 1
}

build() {
    cd "$srcdir/$_pkgbasename"
    
    python setup.py bdist
}


package() {
    _pkg=$(ls "$srcdir/$_pkgbasename/dist/")
    tar -xC "$pkgdir/" -f "$srcdir/$_pkgbasename/dist/$_pkg"

    mkdir -p "$pkgdir/usr/bin"

    _python=$(ls "$pkgdir/usr/lib/")
}

pkgver() {
    cd "${srcdir}/${_pkgbasename}"

    printf 'r%s.%s.%s\n' \
        "$( git rev-list --count 'HEAD' )" \
        "$( git log --max-count='1' --pretty='format:%ct' )" \
        "$( git rev-parse --short 'HEAD' )"
}

package() {
    cd "${srcdir}/${_pkgbasename}"

    python setup.py install --root="${pkgdir}" --optimize=1
}
