# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>
pkgname=pyocd
_pkgname=pyOCD
pkgver=0.12.0
pkgrel=1
pkgdesc="Python On Chip Debugger and programmer for ARM Cortex-M microcontrollers using CMSIS-DAP"
url="https://github.com/mbedmicro/pyocd"
depends=('python2'
         'python2-setuptools'
         'python2-pyusb'
         'python2-intelhex'
         'python2-enum34'
         'python2-websocket-client'
         'python2-backports.ssl_match_hostname'
         'python2-future'
         'python2-pyelftools'
         'python2-colorama'
         'python2-intervaltree'
         )
optdepends=()
license=('Apache')
arch=('any')
# Sigh: Make sure you're not using GitHub's tarballs (or similar ones), as those don't contain the necessary metadata. Use PyPI's tarballs instead.
#source=("https://github.com/mbedmicro/${pkgname}/archive/v${pkgver}.tar.gz")
source=("https://files.pythonhosted.org/packages/89/03/ba2b7c7573b384a92981a6a199abd88a688df7f2dbbee1eea872366b84c0/pyOCD-0.12.0.tar.gz")
sha512sums=('dadaeb0a9a5f1dde65fa4b131836813d95a9be93e044f6cb9097028ab7700823264f85c3f66aecfe3ec373f1346a7d9eacd7fe788ac9042976f2e4165932be2a')

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

