# vim: set filetype=sh:
# Maintainer: Yen Chi Hsuan <yan12125@gmail.com>

pkgname=python2-jedihttp-git
pkgver=r144.d9f9f3c
pkgrel=1
pkgdesc="Simple http wrapper around jedi (with yan12125's packaging patch)"
license=('Apache')
arch=('any')
url='https://github.com/vheon/JediHTTP'
depends=('python2-bottle' 'python2-jedi' 'python2-waitress')
makedepends=('python2-setuptools')
source=('git+https://github.com/vheon/JediHTTP'
        'packaging.patch'::'https://github.com/vheon/JediHTTP/compare/master...yan12125:packaging.patch')
sha256sums=('SKIP'
            'fe4e479ed0c616608ec35150965f696fa1e9daae1b9209adbb51131dda294f54')

pkgver() {
  cd "$srcdir/JediHTTP"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
    cd "${srcdir}/JediHTTP"
    patch -i ../packaging.patch -p1
}

package() {
    cd "${srcdir}/JediHTTP"
    python2 setup.py install --root="${pkgdir}" --optimize=1
}
