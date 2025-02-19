_pkgname=catcli
pkgname="${_pkgname}-git"
pkgver=0.5.4.r0.gc69cd67
pkgrel=4
pkgdesc="The command line catalog tool for your offline data"
arch=('any')
url="https://github.com/deadc0de6/catcli"
license=('GPL')
groups=()
depends=('python' 'python-setuptools' 'python-docopt' 'python-anytree' 'python-psutil')
optdepends=('python-pyfzf: provides the ability to use fzf for find'
            'python-fusepy: provides the ability to mount the catalog using fuse')
makedepends=('git')
provides=(catcli)
conflicts=(catcli)
source=("git+https://github.com/deadc0de6/catcli.git")
md5sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//g'
}

package() {
  cd "${_pkgname}"
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm644 ${srcdir}/${_pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -Dm644 ${srcdir}/${_pkgname}/README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
}

