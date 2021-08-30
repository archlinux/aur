_pkgname=wl-delicolour-picker
pkgname=$_pkgname-git
pkgver=2.0.1.r2.g74282c8
pkgrel=1
pkgdesc="A color picker for delicolour that works on wayland"
arch=('any')
url="https://github.com/j-waters/wl-delicolour-picker"
license=('MIT')
depends=('grim' 'slurp' 'imagemagick' 'wl-clipboard' 'delicolour')
makedepends=('git')
provides=('wl-delicolour-picker')
source=("${_pkgname}::git+${url}.git")
md5sums=(
  'SKIP'
)

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${srcdir}/${_pkgname}"

  make -j1 DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
