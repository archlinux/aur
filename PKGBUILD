
# Maintainer : Zenn <mine.minefis@gmail.com>

pkgname=wlhc
_gitname=wlhc
_gitrepo=https://git.sr.ht/~whynothugo/wlhc
pkgver=r.5fad1ca
pkgrel=1
pkgdesc="Wayland hot corners"
arch=('any')
license=('custom:wlhc')
url='https://git.sr.ht/~whynothugo/wlhc'
depends=('wayland-compositor')
makedepends=('wayland-protocols' 'wlr-protocols' 'hare-wayland' 'hare-ev')
source=(
    "git+${_gitrepo}"
    "wlhc.patch"
)
md5sums=(
    'SKIP'
    'SKIP'
)

pkgver() {
	cd ${srcdir}/${_gitname}
    printf "r.%s" $(git rev-parse --short HEAD)
}

build()
{
	cd "${srcdir}/${_gitname}"
    patch main.ha < ../../wlhc.patch
	make
}

package()
{
  cd "${srcdir}/${pkgname}"
  install -Dm755 wlhc "${pkgdir}/usr/bin/wlhc"
}

