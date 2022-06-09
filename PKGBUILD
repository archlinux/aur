# Maintainer: fossdd <fossdd@pwned.life>
pkgname=himitsu-ssh-git
_pkgname=${pkgname%-git}
pkgver=r15.888de6c
pkgrel=1
pkgdesc='SSH integration for Himitsu'
url='https://sr.ht/~sircmpwn/himitsu-ssh'
license=(GPL-3.0)
arch=(x86_64)
depends=()
makedepends=(hare hare-ssh)
conflicts=(himitsu-git)
provides=(himitsu-ssh)
source=("git+https://git.sr.ht/~sircmpwn/himitsu-ssh")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_pkgname"
  make
}

check() {
  cd "$_pkgname"
  make check
}

package() {
  cd "$_pkgname"
  install -Dm755 "hissh-agent" "$pkgdir/usr/bin/hissh-agent"
  install -Dm755 "hissh-import" "$pkgdir/usr/bin/hissh-import"
}
