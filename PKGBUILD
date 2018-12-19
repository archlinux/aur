# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>
pkgname=pyocd
pkgver=0.14.3
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
source=("https://files.pythonhosted.org/packages/6c/ae/0baea35a5d061315af00b4b461efa9f1f0c897017230442939f18e9e6885/pyocd-0.14.3.tar.gz")
sha512sums=('5f356a202ed9ce7cbf6a6e3f56a5cc85dc61b77ba360d68d0d20b0b1b65a94259da47e3594275b151ce7436645cfb6eb216f1f80831203ac8df15059dfb4e0f6')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"

    # Start to make it work with python3 :( since the deps for python2 libs are a bigger headache
    #sed -i -e "s:, 'enum34'::" setup.py
    #2to3 -w .

    # pyocd-gdbserver fails with:
    # uncaught exception: Can't convert 'bytes' object to str implicitly
    # Traceback (most recent call last):
    #   File "/usr/lib/python3.5/site-packages/pyOCD/tools/gdb_server.py", line 250, in run

}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python2 setup.py build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python2 setup.py install --root="$pkgdir" --optimize=1 
}

