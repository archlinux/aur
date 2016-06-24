# Maintainer: Eli Schwartz <eschwartz93@gmail.com>

# All my PKGBUILDs are managed at https://github.com/eli-schwartz/pkgbuilds

_pkgname=FanFicFare
pkgname=fanficfare-git
pkgver=2.3.4.r0.gf1d9760
pkgrel=1
pkgdesc="A tool for downloading fanfiction to eBook formats"
arch=('any')
url="https://github.com/JimmXinu/${_pkgname}"
license=('Apache')
depends=('python2' 'python2-beautifulsoup4' 'python2-chardet' 'python2-html5lib'
         'python2-html2text')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git://github.com/JimmXinu/${_pkgname}")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${_pkgname}"
    python2 setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
