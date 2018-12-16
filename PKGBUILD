# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>
pkgname=pyocd
pkgver=0.14.1
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
source=("https://files.pythonhosted.org/packages/12/4a/cc22b847cbb0c56e13e17ac6ea497d12297f7a5792ceb7be981d52551f5e/pyocd-0.14.1.tar.gz")
sha512sums=('289f26844907acfbebcf98e468e7b61547608c3d48b8f9c35e59bc8847fb1b3a3ce6955b8c8ec02ec91daee215762304c5da1487fa55ad64c758cbab4e03b53b')

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

