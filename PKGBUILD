# Maintainer : Daniel Bermond < archlinux-org: dbermond >

_commit='1088c684e5ebbb8d0bb4c8916d441c3637d5f1a6'

pkgbase=python-sureal
pkgname=('python-sureal' 'python2-sureal')
_srcname=sureal
pkgver=0.2
pkgrel=1
pkgdesc='Subjective quality scores recovery from noisy measurements'
arch=('any')
url='https://github.com/Netflix/sureal/'
license=('APACHE')
makedepends=('git' 'python' 'python-setuptools' 'python-numpy'
             'python2' 'python2-setuptools' 'python2-numpy')
source=("git+https://github.com/Netflix/sureal.git#commit=${_commit}?signed")
validpgpkeys=('5DE3E0509C47EA3CF04A42D34AEE18F83AFDEB23')
sha256sums=('SKIP')

prepare() {
    cp -a "$_srcname" "${_srcname}-py2"
}

build() {
    cd "$_srcname"
    python setup.py build
    
    cd "${srcdir}/${_srcname}-py2"
    python2 setup.py build
}

package_python-sureal() {
    depends=('python' 'python-numpy' 'python-scipy' 'python-matplotlib' 'python-pandas')
    
    cd "$_srcname"
    python setup.py install --root="$pkgdir" --skip-build --optimize='1'
}

package_python2-sureal() {
    pkgdesc='Subjective quality scores recovery from noisy measurements (python2)'
    depends=('python2' 'python2-numpy' 'python2-scipy' 'python2-matplotlib' 'python2-pandas')
    
    cd "${_srcname}-py2"
    python2 setup.py install --root="$pkgdir" --skip-build  --optimize='1'
    
    mv "$pkgdir"/usr/bin/sureal{,2}
}
