# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# See http://wiki.archlinux.org/index.php/Python_Package_Guidelines for more
# information on Python packaging.

# Maintainer: Sean Anderson <seanga2@gmail.com>
pkgname=python-kflash
pkgver=0.9.1
pkgrel=2
pkgdesc="A Python-based cross-platform Kendryte K210 UART ISP Utility"
arch=(any)
url="https://github.com/kendryte/kflash.py"
license=('MIT')
groups=()
depends=('python' 'python-pyserial' 'python-pyelftools')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://github.com/kendryte/kflash.py/archive/v$pkgver.tar.gz")
sha512sums=('0bd05acc3b3118186757b293c3b8b95c4590f69c07cd6b6b3802795ba3406cb6cedf6dea57fdfaad89e8939f23dfc95f921572fa089fd3649a4153265b9bdf0b')

prepare() {
  cd "$srcdir/kflash.py-$pkgver"
  sed -i "s/enum34\([^']*\)/enum34\1;python_version < \"3.4\"/g" setup.py
}

package() {
  cd "$srcdir/kflash.py-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
