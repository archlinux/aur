# Maintainer: Doug Newgard <scimmia at archlinux dot org>

_pkgname=quasselgrep
pkgname=$_pkgname-git
pkgver=r95.g9b6b0bc
pkgrel=4
pkgdesc='Tool for searching quassel logs from the commandline'
arch=('any')
url='https://github.com/fish-face/quasselgrep'
license=('GPL-2.0-or-later')
depends=('python' 'python-setuptools' 'python-dateutil' 'python-pycryptodome')
makedepends=('git')
optdepends=('python-psycopg2: Connect to postgres databases')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=('git+https://github.com/fish-face/quasselgrep.git'
        'quasselgrep-timestamps.patch::https://patch-diff.githubusercontent.com/raw/fish-face/quasselgrep/pull/22.patch'
	'quasselgrep-py3.7.patch::https://patch-diff.githubusercontent.com/raw/fish-face/quasselgrep/pull/26.patch')
sha256sums=('SKIP'
            '398faf15be411720f2859453a3c16ddbe8cb708c35899dfbf694dbeff6ad6598'
            'e45de4a40ef349d1c53442c69d1c5f139d1d3ec5e5d4d807e9defec4487cb8c5')

pkgver() {
  cd $_pkgname

  printf 'r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $_pkgname

  patch -Np1 < ../quasselgrep-timestamps.patch
  patch -Np1 < ../quasselgrep-py3.7.patch
}

package() {
  cd $_pkgname

  python setup.py install --root="$pkgdir" --optimize=1
}
