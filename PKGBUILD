# Maintainer: Martin Kaffanke <m.kaffanke@gmail.com>

pkgname=michel-orgmode-hg
_pkgname=michel-orgmode
pkgver=r70.0a1f22038245
pkgrel=4
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
            '893adec9f17270147b80d8e3835457114c36aad99eea462e9d72402278859926')

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

