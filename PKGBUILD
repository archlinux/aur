
# Maintainer: Yongchun Jiang <JSpringYC@gmail.com>
# Contributor: Yongchun Jiang <JSpringYC@gmail.com>
# Packager: Yongchun Jiang <JSpringYC@gmail.com>

pkgname=mycli-git
_pkgname=mycli
pkgver=1.24.2.r0.g832086b
pkgrel=2
# epoch=
pkgdesc="A Terminal Client for MySQL with AutoCompletion and Syntax Highlighting."
arch=("any")
url="mycli.net"
license=("BSD")
# groups=()
depends=(
    "python"
    "python-click"
    "python-cryptography"
    "python-pygments"
    "python-prompt_toolkit"
    "python-pymysql"
    "python-sqlparse"
    "python-configobj"
    "python-cli_helpers"
    "python-pyperclip"
    "python-pyaes"
)
makedepends=("python-setuptools")
optdepends=("python-paramiko: SSH support")
provides=("mycli")
conflicts=("mycli")
# replaces=()
# backup=()
# options=()
# install=
source=("git+https://github.com/dbcli/mycli")
sha256sums=("SKIP")

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/v*//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/$_pkgname"
    python setup.py build
}

package() {
	cd "$srcdir/$_pkgname"
	install -D -m 644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	python setup.py install --root="$pkgdir" --optimize=1
}
