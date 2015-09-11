pkgbase=saldl-git
pkgname=("$pkgbase")
pkgver=44_490a555_v12+0
pkgrel=1
pkgdesc="A CLI downloader optimized for speed and early preview, based on libcurl."
arch=('i686' 'x86_64')
license=('AGPL')
depends=('curl' 'libevent')
makedepends=('python' 'git')
source=($pkgbase::git://github.com/saldl/saldl.git)
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgbase"
  last_tag="$(git describe --tags --abbrev=0 HEAD || echo '')"
  if [[ -n $last_tag  ]]; then
	  echo "$(git rev-list --count HEAD)_$(git rev-parse --short HEAD)_${last_tag//-/.}+$(git rev-list --skip=`git rev-list --count ${last_tag}` --count HEAD)"
  else
	  echo "$(git rev-list --count HEAD)_$(git rev-parse --short HEAD)"
  fi
}

build() {
  cd "$srcdir/$pkgbase"
  ./waf configure --prefix="/usr"
  ./waf build
}

package_saldl-git() {
  cd "$srcdir/$pkgname"
  ./waf install --destdir="$pkgdir" install
}
