# Maintainer: Alberto Fanjul <albertofanjul@gmail.com>
pkgname=sjcam-git
pkgver=r23.b96760b
pkgrel=1
pkgdesc="A python CLI tool for controlling SJCAM WiFi Sports Cameras"
arch=(x86_64 i386)
url="https://github.com/AdamLaurie/sjcam"
license=('GPL')
groups=()
depends=()
makedepends=(git python-setuptools)
provides=(sjcam-git)
conflicts=(sjcam)
replaces=(sjcam)
backup=()
options=()
install=
source=("$pkgname::git+https://github.com/AdamLaurie/sjcam"
        "Avoid-warning-with-beautifulsoup.patch"
        "Force-run-under-python2.patch"
)
noextract=()
md5sums=('SKIP'
         '3cb7c894c3610c1893d9c1be246bff94'
         'd7bb9be4165e48a51f4e52d99e2a386b')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

prepare() {
   cd "$srcdir/${pkgname}"
   patch -p1 -i "$srcdir/Avoid-warning-with-beautifulsoup.patch"
   patch -p1 -i "$srcdir/Force-run-under-python2.patch"
}

pkgver() {
   cd "$srcdir/${pkgname}"

   # Git, tags available
   #printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"

   # Git, no tags available
   printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
   cd "$srcdir/${pkgname}"
   python2 setup.py build
}

package() {
   cd "$srcdir/${pkgname}"
   python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
