# Maintainer: Mario Finelli <mario at finel dot li>

pkgname=backblaze-b2-git
pkgver=r257.a132718
pkgrel=1
pkgdesc="Backblaze B2 Command Line Client."
arch=('any')
url="https://www.backblaze.com/b2/cloud-storage.html"
license=('MIT')
depends=('python2')
makedepends=('git')
optdepends=('python-tqdm: upload/download progress bar')
provides=('backblaze-b2')
conflicts=('backblaze-b2')
source=('git://github.com/Backblaze/B2_Command_Line_Tool.git')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/B2_Command_Line_Tool"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/B2_Command_Line_Tool"
    python2 setup.py build
}

package() {
    cd "$srcdir/B2_Command_Line_Tool"
    python2 setup.py install --root="$pkgdir" --optimize=1

    install -Dm0644 contrib/bash_completion/b2 "$pkgdir/etc/bash_completion.d/b2"
    install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/backblaze-b2/LICENSE"
}
