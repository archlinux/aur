# Maintainer: Chris Kitching <chriskitching@linux.com>

pkgname=python2-lnt-git
pkgver=r1796.1384b08
pkgrel=1
pkgdesc="LLVM nightly test infrastructure"
arch=('x86_64')
depends=(
    python2
    python2-pip
    python2-setuptools

    python2-six
    python2-flask
    python2-flask-restful
    python2-jinja
    python2-markupsafe
    python2-sqlalchemy
    python2-werkzeug
    python2-argparse
    python2-itsdangerous
    python2-dateutil
    python2-gnupg
    python2-pytz
    python2-wsgiref
    python2-wtforms
    python2-flask-wtf
    python2-typing
    python2-click
    python2-yaml
    python2-requests
    python2-llvm-lit
)
source=(
  'git+https://github.com/llvm-mirror/lnt.git'
  'requirements.patch'
)
md5sums=(
  'SKIP'
  '2426050291a6748ffece9c7ef3a5a9ee'
)

pkgver() {
  cd "lnt"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "lnt"
  patch -p1 < $srcdir/requirements.patch
}

build() {
  cd "lnt"
  python2 setup.py build
}

package() {
  cd "lnt"
  python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
