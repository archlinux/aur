# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>

_gitname=yara-python
pkgbase=python-yara-git
pkgname=('python-yara-git')
pkgver=4.5.4.419.74920b6
pkgrel=1
pkgdesc='Tool aimed at helping malware researchers to identify and classify malware samples'
url='https://github.com/VirusTotal/yara-python'
arch=('i686' 'x86_64')
license=('Apache')
makedepends=('git' 'yara' 'python-setuptools' 'python2-setuptools')
source=(${pkgbase}::git+https://github.com/VirusTotal/${_gitname})
sha512sums=('SKIP')

pkgver() {
  cd ${pkgbase}
  printf "%s.%s.%s" "$(git describe --tags --abbrev=0|cut -dv -f2|cut -d- -f1)" \
    "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  (cd ${pkgbase}
    python setup.py build --dynamic-linking
  )
}

package_python-yara-git() {
  depends=('python' 'yara')
  provides=('python-yara')
  conflicts=('python-yara')
  cd ${pkgbase}
  python setup.py install --root="${pkgdir}" -O1 --skip-build
  install -Dm 644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README"
  ln -s /usr/share/doc/yara/docs "${pkgdir}/usr/share/doc/${pkgname}/docs"
}

