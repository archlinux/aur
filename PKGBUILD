# Maintainer: Sean Haugh <seanphaugh@gmail.com>

pkgname=python-pywal-git
_gitname=pywal
pkgver=1.0.3.r0.gbb22b06
pkgrel=1
pkgdesc='Generate and change colorschemes on the fly'
arch=('any')
url='https://github.com/dylanaraps/pywal/'
license=('MIT')
depends=('python'
         'python-setuptools'
         'imagemagick')
optdepends=('feh: set wallpaper'
            'nitrogen: set wallpaper')
provides=("python-pywal=$pkgver-$pkgrel")
conflicts=('python-pywal')
source=('git+https://github.com/dylanaraps/pywal.git')
md5sums=('SKIP')

pkgver() {
  cd "${_gitname}"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  cd "${_gitname}"
  python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
  install -Dm644 "$srcdir/${_gitname}/LICENSE.md" \
                 "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
