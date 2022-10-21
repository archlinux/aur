pkgname=python-fonts-git
pkgver=r16.3abfa4b
pkgrel=1
pkgdesc='Python font packaging framework '
arch=(x86_64)
url='https://github.com/pimoroni/fonts-python'
license=('custom')
source=("git+https://github.com/pimoroni/fonts-python.git")
sha512sums=('SKIP')
depends=('python')
makedepends=('python-setuptools')
provides=('python-fonts')
conflicts=('python-fonts')

pkgver() {
    cd $srcdir/fonts-python
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd $srcdir/fonts-python/fonts
    python setup.py install --root="$pkgdir" --optimize=1
    for _dir in $(ls -d $srcdir/fonts-python/font-*/)
    do
      cd $_dir
      python setup.py install --root="$pkgdir" --optimize=1
    done
}
