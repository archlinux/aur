# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>
pkgname=pyocd
_pkgname=pyOCD
pkgver=0.8.1a1
pkgrel=1
pkgdesc="Python On Chip Debugger and programmer for ARM Cortex-M microcontrollers using CMSIS-DAP"
url="https://github.com/mbedmicro/pyocd"
depends=('python2' 'python2-setuptools' 'python2-pyusb' 'python2-intelhex' 'python2-enum34' 'python2-websocket-client' 'python2-backports.ssl_match_hostname')
optdepends=()
license=('Apache')
arch=('any')
# Sigh: Make sure you're not using GitHub's tarballs (or similar ones), as those don't contain the necessary metadata. Use PyPI's tarballs instead.
#source=("https://github.com/mbedmicro/${pkgname}/archive/v${pkgver}.tar.gz")
source=("https://pypi.python.org/packages/c5/2c/274a31b605f40f66aff97362bef211730ae5410f5e4539031c5ef2e19b6d/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('d5d187bdb4df8223e38e3448b44ca25236aab72b6a5fdbe102455ea09b66b81424ac99c47542c841c17d9d360e7e73ceda3ba1bb1f1e5fee747764784015ef9a')

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

