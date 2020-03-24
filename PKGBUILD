# Maintainer: Térence Clastres <t dot clastres at gmail dot com>
# Contributor: Ranieri Althoff <ranisalt+aur at gmail dot com>


pkgname=amdgpu-clocks-git
pkgver=r28.02492e9
pkgrel=1
pkgdesc='Simple script to control power states of amdgpu driven GPUs'
url='https://github.com/sibradzic/amdgpu-clocks'
license=('GPL2')
arch=('any')
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
depends=('bash')
source=("${pkgname}::git+${url}.git")
sha512sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
 cd "$pkgname"
 sed -i 's/\/local//g' amdgpu-clocks.service
}


package() {
  cd "$pkgname"
  install -Dm755 amdgpu-clocks "$pkgdir/usr/bin/amdgpu-clocks"
  install -Dm644 amdgpu-clocks.service "$pkgdir/usr/lib/systemd/system/amdgpu-clocks.service"
  install -Dm755 amdgpu-clocks-resume "$pkgdir/usr/lib/systemd/system-sleep/amdgpu-clocks-resume"
}
