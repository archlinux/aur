# Maintainer: James An <james@jamesan.ca>

pkgname=selfspy-vis-git
_pkgname=${pkgname%-git}
pkgver=0.3.r11.ge31c023
pkgrel=1
pkgdesc='Visualization of Selfspy Database. Using @gurgeh /selfspy.'
arch=('any')
url="https://perso.crans.org/besson/publis/$_pkgname"
license=('GPL3')
depends=('python2-matplotlib  ' 'python2-pandas' 'python2-seaborn' 'selfspy')
makedepends=('git')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("$_pkgname"::"git+https://github.com/Naereen/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  (
    set -o pipefail
    git describe --long --tag | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/^v//' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd "$_pkgname"

  destdir="$(python2 -c "import site; print(site.getsitepackages()[0])")/$_pkgname"
  install -dm755 "$pkgdir/$destdir"
  for file in *; do
    install -D -m644 "$file" "$pkgdir/$destdir/$file"
  done
}
