# Maintainer: Shyam (shyamganesh01@gmail.com)

pkgname=pspy
_pkgbase=pspy
pkgver=1.2.1
pkgrel=1
pkgdesc="Monitor linux processes without root permissions."
arch=('any')
url="https://github.com/DominicBreuker/pspy"
license=('GPL')
makedepends=('findutils' 'github-cli')
conflicts=("pspy-bin")
provides=("pspy")

source=(
  "${_pkgbase}32::$url/releases/download/v$pkgver/${_pkgbase}32"
  "${_pkgbase}32s::$url/releases/download/v$pkgver/${_pkgbase}32s"
  "${_pkgbase}64::$url/releases/download/v$pkgver/${_pkgbase}64"
  "${_pkgbase}64s::$url/releases/download/v$pkgver/${_pkgbase}64s"
)
sha256sums=('1e38ac09d7851b22e16980abc58f93cabdc4a02859c56a2810aa51930277d450'
            'f2e8ed736e90aa38fd23606937e9e8393db6d10cb3be426afe4b65564860df35'
            'c93f29a5cc1347bdb90e14a12424e6469c8cfea9a20b800bc249755f0043a3bb'
            'e0277c164facb2d0fb95682a77887dd908b0e1dacb28a2bcafd6728b34835425')

pkgver() {
  gh release view -R DominicBreuker/pspy --json tagName --jq '.tagName' -q '.[]' | sort -V | tail -n 1 | cut -c2-
}

package() {
  cd "$srcdir"
  find . -name "${_pkgbase}*" -print0 | \
    xargs -I{} -0 install -Dm755 {} "$pkgdir/usr/share/$_pkgbase/{}"
}
