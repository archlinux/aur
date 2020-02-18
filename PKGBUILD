# Maintainer: bobpaul

_pkgbase=fbchat-asyncio
pkgname=python-${_pkgbase}-git
pkgver=r965.9d26c79
pkgrel=1
pkgdesc="A facebook chat library with asyncio support"
arch=(any)
conflicts=(python-fbchat-asyncio python-fbchat)
provides=(python-fbchat-asyncio python-fbchat)
license=(BSD)
depends=(python
	    python-aenum
	    python-hbmqtt-tulir-git
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
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
