# Maintainer: Eric Waller <ewwaller+aur gmail com>

pkgname=hpfall-git
pkgver=r5.be24a8b
pkgrel=1
pkgdesc="Disk protection for HP machines."
arch=('x86_64' 'i686')
url_name="github.com/srijan/hpfall.git"
url="https://"${url_name}
License=('GPL')
depends=()
makedepends=('git')
md5sums=('SKIP'  3a6a193021fe5f3078f97b8c2a4c8538 ac946477d1996e68fa63792829fd8a97)

source=("${pkgname}"::"git://"${url_name} 'log_to_syslog.patch' 'hpfall.service')

pkgver() {
  cd "$srcdir/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare(){
  cd "$srcdir/${pkgname}"
  patch -R hpfall.c < ../log_to_syslog.patch
}

build() {
  cd "$srcdir"/${pkgname}
  make
} 

package() {
  install -Dm755 ${pkgname}/hpfall $pkgdir/usr/bin/hpfall
  install -Dm755 ${pkgname}/../hpfall.service $pkgdir/usr/lib/systemd/system/hpfall.service

}