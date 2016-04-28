# Maintainer: Mario Finelli <mario at finel dot li>

_pkgname=backblaze-b2
_reponame="B2_Command_Line_Tool"

pkgname="${_pkgname}-git"
pkgver=r534.4e5f238
pkgrel=1
pkgdesc="Backblaze B2 Command Line Client."
arch=('any')
url="https://www.backblaze.com/b2/cloud-storage.html"
license=('MIT')
depends=('python2' 'python2-futures' 'python2-portalocker')
makedepends=('git' 'python2-setuptools')
optdepends=('python-tqdm: upload/download progress bar')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git://github.com/Backblaze/$_reponame.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_reponame"
    printf "r%s.%s" "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$_reponame"
    python2 setup.py build
}

package() {
    cd "$srcdir/$_reponame"
    python2 setup.py install --root="$pkgdir" --optimize=1

    install -Dm0644 contrib/bash_completion/b2 \
        "$pkgdir/etc/bash_completion.d/b2"
    install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
