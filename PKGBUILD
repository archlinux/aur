# Maintainer: TwoLeaves <ohneherren@gmail.com>
# Maintainer: kumax <kumax2048@yandex.com>
pkgname=sam
pkgver=r65.b7f287f
pkgrel=1
pkgdesc="Sam is an adaption to C of the speech software SAM (Software Automatic Mouth) for the Commodore C64."
url="http://simulationcorner.net/index.php?page=sam"
arch=('x86_64' 'i686' 'aarch64')
license=('unknown')
depends=('sdl')
makedepends=('git')
source=('SAM::git+http://github.com/s-macke/SAM/#branch=master' '2cb53f.patch::https://github.com/s-macke/SAM/commit/2cb53fbdbba78f2943e5ab6d4569d5e0a056e3ad.patch')
md5sums=('SKIP' '328fde18fcc7706f02453a56d0f4e316')

prepare() {
  cd ${srcdir}/SAM
  git am ${srcdir}/2cb53f.patch
}

pkgver() {
  cd SAM
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/SAM"
  make
}

package() {
  cd "${srcdir}/SAM"
  install -D -m755 sam "${pkgdir}"/usr/bin/sam
}
