# Maintainer: Simon Hanna <simon dot hanna AT serve-me DOT info>
# MaintainerL Nathan Owens <ndowens @ artixlinux.org>

pkgname=python-jwt
pkgver=1.7.1
pkgrel=1
pkgdesc="JSON Web Token implementation"
arch=(any)
url="https://github.com/jpadilla/pyjwt"
license=('MIT')
depends=('python')
makedepends=('python-setuptools' 'git')
options=(!emptydirs)
source=("git+https://github.com/jpadilla/pyjwt#tag=${pkgver}"
        "python3_8.patch::https://github.com/jpadilla/pyjwt/commit/09f2e20c6621b531be37392a514d8805f9804723.patch")
sha256sums=('SKIP'
            'dd4467fb91e425d840532df377144f66495ea5588de2844e56d4830ada8785f9')

prepare() {
  cd "$srcdir/pyjwt"
  git apply --stat "$srcdir"/python3_8.patch
}

build() {
  cd "$srcdir/pyjwt"
  python setup.py build
}

package() {
  cd "$srcdir/pyjwt"
  python setup.py install --root="$pkgdir/" --optimize=1
  
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
