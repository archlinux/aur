# Maintainer: aksr <aksr at t-com dot me>
pkgname=lsdreader-git
pkgver=0.2.8.r14.d8256cf
pkgrel=1
epoch=
pkgdesc="Decompile Lingvo LSD dictionary to DSL."
arch=('i686' 'x86_64')
url="https://github.com/sv99/lsdreader"
license=('unknown')
groups=()
depends=('python2')
makedepends=('git' 'python2-setuptools')
optdepends=()
checkdepends=()
provides=('lsdreader')
conflicts=('lsdreader')
replaces=()
backup=()
options=()
changelog=
install=
source=("$pkgname::git+https://github.com/sv99/lsdreader.git")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "%s.r%s.%s" "$(git describe --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g;s/^v//')" \
                     "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

check() {
  cd "$srcdir/$pkgname"
  python2 setup.py test
}

package() {
  cd "$srcdir/$pkgname"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

