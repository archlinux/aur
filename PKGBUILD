# Maintainer: Vincent BESANCON <besancon.vincent@gmail.com>
pkgname=dh-virtualenv-git
_gitname=dh-virtualenv
pkgver=0.10.r0.gb3ed15e
pkgrel=1
pkgdesc='Python virtualenvs in Debian packages (git version)'
arch=('any')
url='https://github.com/spotify/dh-virtualenv'
license=('GPL2')
source=("git+https://github.com/spotify/${_gitname}")
md5sums=('SKIP')
depends=(
    'debhelper'
    'python-virtualenv'
)
makedepends=(
    'python'
    'python-setuptools'
    'git'
)
provides=('dh-virtualenv')
conflicts=('dh-virtualenv')

package() {
  cd "${srcdir}/${_gitname}"
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -d "${pkgdir}/usr/share/perl5/vendor_perl"
  cp -r lib/* "${pkgdir}/usr/share/perl5/vendor_perl"
  install -D -m644 -t \
      "${pkgdir}/usr/share/debhelper/autoscripts" autoscripts/*-dh-virtualenv
  install -D -m644 LICENSE \
      "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

pkgver() {
  cd "${srcdir}/${_gitname}"
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g;s/^v//'
} 
