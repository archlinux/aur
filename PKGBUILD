# $Id: PKGBUILD,v 1.20 2009/01/26 17:07:33 angvp Exp $
# Maintainer: Douglas Soares de Andrade <dsa@aur.archlinux.org>
# Contributor: Angel 'angvp' Velasquez <angvp[at]archlinux.com.ve> 

pkgname=python-numpy
pkgver=1.2.1
pkgrel=4
pkgdesc="Scientific tools for Python"
arch=('i686' 'x86_64')
license=('custom')
url="http://numpy.scipy.org/"
depends=('blas' 'python-nose' 'lapack')
source=("http://downloads.sourceforge.net/numpy/numpy-$pkgver.tar.gz" patch-lib64.patch)

build() {
    cd "$srcdir/numpy-$pkgver"

    msg "patching system_info.py for compatibility with lib64"
    patch numpy/distutils/system_info.py < $startdir/patch-lib64.patch # FS#12869

    python setup.py config_fc --fcompiler=gnu95 build || return 1
    python setup.py config_fc --fcompiler=gnu95 install --prefix=/usr --root="$pkgdir" || return 1

    install -D -m644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
md5sums=('1bc6dbddaf4b48ded8a619c6438fff37'
         'fd9035cc359d43ca78c488738213b8fe')
