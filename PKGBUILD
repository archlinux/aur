# Maintainer: Sam Stuewe <halosghost at archlinux dot info>
# Contributor: Robin Choudhury <rchoudhu@calpoly.edu>>

pkgname=rst2html5-git
pkgver=0.5.1.r177.7e315ab
pkgrel=1
pkgdesc='RestructuredText to HTML5 + bootstrap css'
arch=('any')
url='https://marianoguerra.github.com/rst2html5'
license=('MIT')
depends=('python2' 'python2-docutils' 'python2-setuptools')
makedepends=('git')
provides=('rst2html5')
conflicts=('rst2html5')
source=("git+https://github.com/marianoguerra/rst2html5")
md5sums=('SKIP')

pkgver () {
  cd "${srcdir}/rst2html5"
  printf '%s.r%s.%s' "$(awk -F"'" '/version/ { print $2 }' setup.py)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/rst2html5"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
  mv "$pkgdir"/usr/bin/rst2html5{,-mg}
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
