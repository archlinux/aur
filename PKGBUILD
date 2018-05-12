pkgname=cms-germany-git
pkgver=r3802.4d519c16
pkgrel=1
pkgdesc="CMS, or Contest Management System, is a distributed system for running and (to some extent) organizing a programming contest. This is a fork used for the German IOI team selection process."
arch=('i686' 'x86_64')
url="https://github.com/ioi-germany/cms"
license=('AGPL3')
depends=(
    'python2'
    'python2-tornado'
    'python2-psycopg2'
    'python2-sqlalchemy'
    'python2-netifaces'
    'python2-crypto'
    'python2-pytz'
    'python2-psutil'
    'python2-six'
    'python2-requests'
    'python2-gevent'
    'python2-werkzeug'
    'patool-py2'
    'python2-bcrypt'
    'python2-chardet'
    'python2-ipaddress'
    'python2-yaml'
    'postgresql'
    'postgresql-client'
    'libcgroup'
    'iso-codes'
    'shared-mime-info'
    'python2-pathlib'
    'asymptote'
    'texlive-core'
    'texlive-fontsextra'
    'texlive-latexextra'
    'texlive-pstricks'
)
optdepends=(
    'python2-pycups: printing support'
    'python2-pypdf: printing support'
    'a2ps: printing support'
    'fpc: support for Pascal submissions'
    'jdk8-openjdk: support for Java submissions'
)
makedepends=(
    'asciidoc'
    'python2-setuptools'
)

provides=('cms-germany' 'isolate-germany')
conflicts=('cms' 'isolate')
install=$pkgname.install

source=(
  'git://github.com/ioi-germany/cms.git'
  'git://github.com/ioi-germany/isolate.git'
)
sha256sums=(
  'SKIP' 'SKIP'
)

pkgver() {
  cd cms
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd cms

  git config submodule.isolate.url "$srcdir/isolate"
  git submodule update

  #mkdir -p "$pkgdir/"lib/python2.7/site-packages/
  #export PYTHONPATH="$pkgdir"/lib/python2.7/site-packages/

  python2 setup.py install --root="$pkgdir" --optimize=1

  #mv "$pkgdir"/lib "$pkgdir"/usr/
  #mv "$pkgdir"/bin "$pkgdir"/usr/
}
