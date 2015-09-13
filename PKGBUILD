# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

_gitname=yara-python
pkgbase=python-yara-git
pkgname=('python-yara-git' 'python2-yara-git')
pkgver=3.4.0.5.88a5a5a
pkgrel=1
pkgdesc="Tool aimed at helping malware researchers to identify and classify malware samples"
url="https://plusvic.github.io/yara/"
arch=('i686' 'x86_64')
license=('Apache')
makedepends=('git' 'yara' 'python-setuptools' 'python2-setuptools')
source=(${pkgbase}::git+https://github.com/plusvic/${_gitname})
sha512sums=('SKIP')

pkgver() {
  cd ${pkgbase}
  printf "%s.%s.%s" "$(git describe --tags --abbrev=0|cut -dv -f2|cut -d- -f1)" \
    "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package_python-yara-git() {
  depends=('python' 'yara')
  provides=('python-yara')
  conflicts=('python-yara')
  cd ${pkgbase}
  python setup.py install --root="${pkgdir}" -O1
  install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README"
  ln -s /usr/share/doc/yara/docs "${pkgdir}/usr/share/doc/${pkgname}/docs"
}

package_python2-yara-git() {
  depends=('python2' 'yara')
  provides=('python2-yara')
  conflicts=('python2-yara')
  cd ${pkgbase}
  python2 setup.py install --root="${pkgdir}" -O1
  install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README"
  ln -s /usr/share/doc/yara/docs "${pkgdir}/usr/share/doc/${pkgname}/docs"
}

# vim: ts=2 sw=2 et:
