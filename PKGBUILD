# Maintainer: Jakob Tsar-Fox <jakob@memeware.net>
pkgname=pince-git
pkgver=0.1.0
pkgrel=1
pkgdesc="A Linux reverse engineering tool inspired by Cheat Engine."
arch=('any')
url="https://github.com/korcankaraokcu/PINCE"
license=('GPL3')
depends=('python' 'python-pexpect' 'python-psutil' 'python-pyqt5' 'gdb')
makedepends=()
source=("$pkgname::git+https://github.com/korcankaraokcu/PINCE.git")
md5sums=('SKIP')

package() {
    cd "$srcdir/$pkgname"
    sed -i "s/\.\/gdb_pince\/gdb-7\.11\.1\/bin\/gdb/\/usr\/bin\/gdb/g" libPINCE/type_defs.py
    install -d "$pkgdir/usr/bin"
    install -d "$pkgdir/usr/share/PINCE"
    install PINCE.py "$pkgdir/usr/share/PINCE"
    cp -r GUI libPINCE media pince-non-stop-files "$pkgdir/usr/share/PINCE"
    ln -s "/usr/share/PINCE/PINCE.py" "${pkgdir}/usr/bin/pince"
}
