# Maintainer: Ding Xiao <tinocodfcdsa10@mails.tsinghua.edu.cn>

pkgname="python2-ruamel.ordereddict"
pkgver=r41.983a529c0f41
pkgrel=1
pkgdesc='This is an implementation of an ordered dictionary with Key Insertion Order'
arch=('any')
url='https://pypi.org/project/ruamel.ordereddict'
license=('MIT')
makedepends=('python2-setuptools'
             'mercurial')
depends=('python2>=2.7')
provides=('python2-ruamel.ordereddict')
source=("${pkgname}::hg+https://bitbucket.org/ruamel/ordereddict")
md5sums=('SKIP')

pkgver() {
  cd ${srcdir}/${pkgname}
  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

prepare() {
  cd ${srcdir}/${pkgname}
}

build() {
  cd ${srcdir}/${pkgname}
  python2 setup.py build
}

package() {
  cd ${srcdir}/${pkgname}
  python2 setup.py install --root=${pkgdir}/ --optimize=1
  install -D -m 644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  rm -f ${pkgdir}/usr/lib/python*/site-packages/*.{txt,md}
}