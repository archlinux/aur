# Maintainer: Quentin Bourgeois <quentin+archlinux@bourgeois.eu>
#
# TODO: * viivakoodi require (python) argparse if python interpreter is 2.6, 
#               3.0 or 3.1 => how to do that ?
_pylibname=viivakoodi
pkgname=("python2-$_pylibname" "python-$_pylibname")
pkgver=0.8.0
pkgrel=1
pkgdesc='Barcode generator for Python. Fork of pyBarcode project.'
arch=('x86_64')
url="https://github.com/kxepal/$_pylibname"
license=('MIT')
groups=()
depends=()
makedepends=()
optdepends=('inkscape: tools for manipulating vector objects (eg: SVG files)')
checkdepends=('python-tox' 'python-pylint' 'python2-tox' 'python2-pylint') 
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$_pylibname-$pkgver.tar.gz::https://github.com/kxepal/$_pylibname/archive/$pkgver.tar.gz" 
        "$_pylibname-$pkgver.tar.gz.sig::https://pki.bourgeois.eu/archlinux/aur/$_pylibname-$pkgver.tar.gz.sig")
noextract=()
md5sums=()
sha1sums=()
sha256sums=('e1a17dc24975d5242202cfbb7534d69dd14eeb26bdf8a10f056c7b04904fef1e' 
            'c161bd90708ca20c841321139f7e8fe5ae53cb25f55d0327fea5b59ac401f8e9')
sha384sums=('e2da627423221298dfc55be93ab07e42d8801f0fa63bcfc5ad6bfa689181bcd0e7eb9525abdfd20aa3637ae56999956b' 
            'b92e09d3e801b55ec97e28b105d8033d6bace8fc869343331e1093bbb35aabe201432e43ea4487014c92b190a65c89f8')
sha512sums=('b9f5fc859b3ec33a1cf264d5ede597ff79cd447043668cf433096bf0bf89e24e1a8bf05f7914420934bc6c03a66ec0df99a203136c3f6506e0fda8e3c6f619fd' 
            '68b6df665e76555489b9abc616fda11180c1c420e8a5dd74c191543335ee0b887fbba8115f7823aed676242b559af10141fc6a40c4b068a39b9e1038917dc29e')
# quentin bourgeois GPG key no package dev but provide a signature of the archive used when creating PKGBUILD file
validpgpkeys=('A5A90A2DE9D979C1BD0085CB8663D1331DD47615') 

check() {
    cd "$srcdir/$_pylibname-$pkgver"
    
    for py_int in python3 python2; do
        msg "Testing $_pylibname-$pkgver with $py_int"
        "$py_int" ./test.py
    done
}

package_python-viivakoodi() {
    # as python-3.0 and python-3.1 need argparse I force for every version
    depends+=('python' 'python-argparse')
    makedepends+=('python-setuptools')
    provides+=('python2-viivakoodi')
    optdepends+=('python-pillow')

    cd "$srcdir/$_pylibname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1

    if [ -f LICENSE ]; then
        mkdir -p "$pkgdir/usr/share/licenses/$pkgname/"
        cp LICENSE "$pkgdir/usr/share/licenses/$pkgname/"
    else
        warning "license file not found"
    fi
}

package_python2-viivakoodi() {
    # as python2.6 need argparse I force for every version
    depends+=('python2>=2.6' 'python2-argparse')          
    makedepends+=('python2-setuptools')
    provides+=('python2-viivakoodi')
    optdepends+=('python2-pillow')

    cd "$srcdir/$_pylibname-$pkgver"
    python2 setup.py install --root="$pkgdir/" --optimize=1

    if [ -f LICENSE ]; then
        mkdir -p "$pkgdir/usr/share/licenses/$pkgname/"
        cp LICENSE "$pkgdir/usr/share/licenses/$pkgname/"
    else
        warning "license file not found"
    fi
}
