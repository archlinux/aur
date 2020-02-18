# Maintainer: bobpaul

_pkgbase=hbmqtt
pkgname=python-${_pkgbase}-tulir-git
pkgver=r795.2df63ac
pkgrel=1
pkgdesc="An opensource MQTT client and broker, tulir's fork"
arch=(any)
conflicts=(python-hbmqtt python-hbmqtt-tulir)
provides=(python-hbmqtt python-hbmqtt-tulir)
license=(MIT)
depends=(python
	     python-docopt
		 python-transitions
		 python-websockets
		 python-passlib
	    )
makedepends=(git)
optdepends=()
source=("${_pkgbase}::git+https://github.com/tulir/${_pkgbase}")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${_pkgbase}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

#prepare() {
#  cd "$srcdir/${_pkgbase}"
#  git reset --hard
#  patch < ../usr-share.patch
#}

package() {
  cd "$srcdir/${_pkgbase}"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 license.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
