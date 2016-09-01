# Maintainer: Martin Kaffanke <m.kaffanke@gmail.com>

pkgname=michel-orgmode-hg
_pkgname=michel-orgmode
pkgver=r70+.0a1f22038245+
pkgrel=2
pkgdesc="Sync org-mode files to google-tasks (uses python)"
arch=('i686' 'x86_64')
url="https://bitbucket.org/edgimar/michel-orgmode"
license=('Public Domain')
depends=('google-api-python-client' 'python-gflags' 'python-dateutil' 'python-oauth2client')
makedepends=('mercurial')
provides=('michel-orgmode')
conflicts=('michel-orgmode')
source=(
"hg+https://bitbucket.org/edgimar/michel-orgmode"
"bugfixes-for-python3.patch"
)
sha256sums=('SKIP'
            '8e9fd6b485dcd67e390c4e0d189c282e734237a2d11a90a915d0609c9608bef2')

pkgver() {
cd "$srcdir/$_pkgname"
printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

prepare() {
cd "$srcdir/$_pkgname"
patch -p1 < ../bugfixes-for-python3.patch
}

build() {
cd "${srcdir}/${_pkgname}"
python setup.py build
}

package() {
cd "${srcdir}/${_pkgname}"
python setup.py install --skip-build --root="$pkgdir/" --optimize=1
}

