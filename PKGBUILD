# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>
pkgname=pyocd
_pkgname=pyOCD
pkgver=0.7.1
pkgrel=1
pkgdesc="Python On Chip Debugger and programmer for ARM Cortex-M microcontrollers using CMSIS-DAP"
url="https://github.com/mbedmicro/pyocd"
depends=('python2' 'python2-setuptools' 'python2-pyusb' 'python2-intelhex' 'python2-enum34')
optdepends=()
license=('Apache')
arch=('any')
# Sigh: Make sure you're not using GitHub's tarballs (or similar ones), as those don't contain the necessary metadata. Use PyPI's tarballs instead.
#source=("https://github.com/mbedmicro/${pkgname}/archive/v${pkgver}.tar.gz")
source=("https://pypi.python.org/packages/cc/05/1be68f04ee71b8b10e24c55c9edc774f6bd3ce3a454981a9f7ea1a26c08d/${_pkgname}-${pkgver}.zip")
sha512sums=('cfabc8224ac455e41338a767c18a7f90f2285ac55478b07ebbcebd27482ae7d20740486d182188da47a2b80e69778da2e8226dc82ba17f0f68afd684a827e123')

prepare() {
    cd "$srcdir/$_pkgname-$pkgver"

    # Start to make it work with python3 :( since the deps for python2 libs are a bigger headache
    #sed -i -e "s:, 'enum34'::" setup.py
    #2to3 -w .

    # pyocd-gdbserver fails with:
    # uncaught exception: Can't convert 'bytes' object to str implicitly
    # Traceback (most recent call last):
    #   File "/usr/lib/python3.5/site-packages/pyOCD/tools/gdb_server.py", line 250, in run

}

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    python2 setup.py build
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python2 setup.py install --root="$pkgdir" --optimize=1 
}

