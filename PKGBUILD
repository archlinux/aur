# Maintainer: Emmanuel Villavizar Trinidad <evillavizartrinidad@gmail.com>
pkgname=xbacklight-ctl-git
_pkgname=xbacklight-ctl
pkgver=r39.03932a4
pkgrel=1
pkgdesc="Use xbacklight easily and receive notifications with a progress bar."
arch=('any')
url="https://github.com/EnmanuelVT/xbacklight-ctl.git"
license=('GPL')
groups=()
depends=('xorg-xbacklight'
         'notify-send.sh')
makedepends=('git'
             'gzip')
optdepends=()
provides=(xbacklight-ctl)
source=("git+$url")
md5sums=('SKIP') #autofill using updpkgsums

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $_pkgname/doc
  gzip xbacklight-ctl.1
  cd ..
}

package() {
  cd $_pkgname
  install -Dm755 xbacklight-ctl "${pkgdir}/usr/bin/xbacklight-ctl"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$_pkgname/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/$_pkgname/README.md"
  cd doc
  install -Dm644 xbacklight-ctl.1.gz "${pkgdir}/usr/share/man/man1/xbacklight-ctl.1.gz"
  cd ..
}
