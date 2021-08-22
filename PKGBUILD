# Maintainer: Doug Johnson <dougvj at dougvj dot net>
pkgname=gitlab-ci-local-git
pkgver=4.23.0.r0.g2195c19
pkgrel=2
source=('gitlab-ci-local-git::git+https://github.com/firecow/gitlab-ci-local.git')
md5sums=('SKIP')
pkgdesc="Run gitlab pipelines locally as shell executor or docker executor"
arch=('i686' 'x86_64')
url="https://github.com/firecow/gitlab-ci-local"
license=('MIT')
makedepends=('git' 'sed' 'npm' 'typescript')

# TODO Don't bundle ts-node with the build perhaps
#      so we can use the system's version
#depends=('ts-node')
pkgver() {
  cd "$pkgname"
  git describe --tags --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
options=("!strip")

build() {
  cd "$pkgname"
  npm install
  npm run build
}

package() {
  cd "$pkgname"
  npm run pkg-linux
  mkdir -p $pkgdir/usr/bin
  cp ./bin/linux/gitlab-ci-local $pkgdir/usr/bin
}

