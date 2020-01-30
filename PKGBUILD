#Maintainer: Tristan Rice <rice at fn dot lc>

_pkgname="iasimage"
pkgname="${_pkgname}-git"
pkgver=20190410.7799ac7
pkgrel=1
pkgdesc='iasimage is a utility program for creating Intel Automotive Service (IAS) images, a binary file format understood by bootloaders to load and initialize Operating Systems or Hypervisors.'
url='https://github.com/intel/iasimage'
arch=('any')
license=('BSD')
depends=('python-idna' 'python-wheel' 'python-cryptography')
makedepends=('git')
source=("${_pkgname}::git+https://github.com/intel/iasimage.git")
sha1sums=('SKIP')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

pkgver() {
cd "${srcdir}/${_pkgname}"
git log -1 --format='%cd.%h' --date=short | tr -d -
}

check() {
cd "${srcdir}/${_pkgname}"
make check
}

package() {
cd "${srcdir}/${_pkgname}"
install -Dm755 iasimage.py "${pkgdir}/usr/bin/iasimage"
install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
