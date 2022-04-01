# Maintainer: Alad Wenter <alad@archlinux.org>
# Contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=asoundconf
epoch=1
pkgver=1.2
_commit=55cdf2e78b7f28ee1808346e5d4e32f7e95618dc # 1.2
pkgrel=7
pkgdesc="utility to read and change the user's ALSA library configuration"
arch=('any')
url="https://bitbucket.org/stativ/asoundconf"
license=('GPL')
depends=('python')
makedepends=('git')
optdepends=('python-gobject: asoundconf-gtk GUI')
source=("git+https://bitbucket.org/stativ/asoundconf.git#commit=$_commit"
        '0001-python3-syntax.patch'
        '0002-python3-spaces.patch'
        '0003-python3-gobject.patch')
sha256sums=('SKIP'
            '7a93b1b05615ea73172e8d7a017d2557dbdaa3d34c51d91d46961c5e85f0d2af'
            'dfde8ccc2d57fee3132a3f7b58858300765e56c5a165e605fc52e8c7550bbcbf'
            'ae7bf3c388e1e6a45f6e0fcd44350d9e5bffb2453e2f397470dab9175ccc1072')

prepare() {
    cd "$pkgname"
    patch -p1 < "$srcdir"/0001-python3-syntax.patch
    patch -p1 < "$srcdir"/0002-python3-spaces.patch
    patch -p1 < "$srcdir"/0003-python3-gobject.patch
}

build() {
    cd "$pkgname"
    python setup.py build
}

package() {
    cd "$pkgname"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
