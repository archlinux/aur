# Maintainer: Azuki <support@azukiapp.com>
_pkgname='azk'
pkgname=${_pkgname}-git
pkgver=0.16.3
pkgrel=1
pkgdesc="azk is a lightweight open source development environment orchestration tool. Instantly & safely run any environment on your local machine."
arch=('x86_64')
url="https://github.com/azukiapp/azk"
license=('Apache')
depends=('libnss-resolver' 'docker' 'rsync')
makedepends=('make' 'fakeroot' 'git')
provides=(${_pkgname%-git}=$pkgver)
conflicts=(${_pkgname%-git})
source=("git+https://github.com/azukiapp/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    git tag -l | sort -V | tail -1 | sed 's/^v//'
}

package() {
  cd "$srcdir/$_pkgname"
  make -e package_linux
  cp -a "$srcdir/$_pkgname/package/v$pkgver/." "$pkgdir/"
}
