# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>
pkgname=pyocd
pkgver=0.14.2
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
source=("https://files.pythonhosted.org/packages/74/2b/618c5ac18961770b26f429c78946cc9003860f1036a6d51902ba23f90811/pyocd-0.14.2.tar.gz")
sha512sums=('37256facae069e6c1f23722a9963c5101fe0c423be3cdd0be6828a6de71b2dc324375c18b5a07519d8a2c4712a51631b4f7edbc9137e1b455e5233d8cf858290')

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

