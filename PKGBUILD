# Maintainer: Bryan Malyn <bim9262 at gmail dot com>

pkgname=ttf-roboto-flex-git
_pkgname=roboto-flex
pkgver=3.100.r0.gb329879500
pkgrel=1
pkgdesc="Upgrades Roboto to become a more powerful typeface system"
makedepends=('git' 'python')
arch=('any')
conflicts=('ttf-roboto-flex')
url="https://github.com/googlefonts/roboto-flex"
license=('custom:OFL')
source=("git+$url.git#commit=b3298795004723896df6568a8acba8efca8520e7")
sha256sums=(SKIP)

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $_pkgname

  python -m venv venv
  . venv/bin/activate
  pip install -r requirements.txt
  gftools builder sources/config.yaml
}

package() {
  cd $_pkgname

  echo $_pkgname
  echo $pkgdir
  install -Dm644 fonts/variable/*.ttf "$pkgdir"/usr/share/fonts/TTF/RobotoFlex-VF.ttf
  install -Dt "$pkgdir"/usr/share/licenses/$pkgname -m644 OFL.txt
}
