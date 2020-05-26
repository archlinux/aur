# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Co-Maintainer: Chris Billington <chrisjbillington at gmail dot com>
pkgname=git-nautilus-icons-git
_pkgname="${pkgname%-git}"
pkgver=1.1.3.r1.gdcf53a0
pkgrel=1
pkgdesc="A Nautilus, Nemo, and Caja extension to overlay icons on files in git repositories"
arch=('any')
url="https://github.com/chrisjbillington/${_pkgname}"
license=('BSD 2-Clause "Simplified"')
depends=('python-gobject')
makedepends=('python-setuptools' 'python-setuptools-scm')
optdepends=('python-nautilus: nautilus support'
            'python-nemo: nemo support'
            'python2-caja: caja support'
            'python2-gobject: caja support')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
replaces=('git-caja-icons-git'
          'git-nemo-icons-git')
source=("git+https://github.com/chrisjbillington/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${_pkgname}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "${srcdir}/${_pkgname}"
    python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # compile Python bytecode for modules outside of site-packages:
    python -m compileall -d / "${pkgdir}"/usr/share
    python -O -m compileall -d / "${pkgdir}"/usr/share
}
