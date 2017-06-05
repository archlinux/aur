pkgname=python2-pyand-git
pkgver=r54.f90701b
pkgrel=1
pkgdesc="A Python wrapper library for ADB and Fastboot"
arch=('any')
url="https://github.com/ardevd/pyand"
license=('MIT')
depends=('python2')
makedepends=('git' 'python2-setuptools')
# The git repo is detected by the 'git:' or 'git+' beginning. The branch
# '$pkgname' is then checked out upon cloning, expediating versioning:
source=($pkgname::git+'https://github.com/ardevd/pyand.git')
# Because the sources are not static, skip Git checksum:
md5sums=('SKIP')
pkgver() {
  cd "$srcdir/$pkgname"
  # Use the tag of the last commit
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  export PYTHONPATH="$pkgdir/usr/lib/python2.7/site-packages"
  cd "$srcdir/"
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m755 "${srcdir}/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/"
  mkdir -p "$pkgdir/usr/lib/python2.7/site-packages"
  easy_install-2.7 --prefix "$pkgdir/usr" python2-pyand-git
}
