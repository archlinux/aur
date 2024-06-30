# Contributor: Martin Sandsmark <martin.sandsmark@kde.org>

pkgname=droidbattles-git
pkgver=r147.8e47dfe
pkgrel=2
pkgdesc='A programming game where you program bots in assembly'
arch=('x86_64')
url='https://github.com/sandsmark/droidbattles'
license=('GPL-2.0-or-later')
depends=('qt5-base')
makedepends=('qt5-base' 'git')
# conflicts=(droidbattles)
provides=('droidbattles')
source=("git+${url}.git"
        "missing-header.patch")
sha256sums=('SKIP'
            '952ac3e0270d33d9e0a4bd86880134001ac53c620d6fd3fb762909974a244260')

pkgver() {
  cd droidbattles
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  patch -d droidbattles -p1 < missing-header.patch
}

build() {
  cd droidbattles
  qmake
  make
}

package() {
  cd droidbattles
  make INSTALL_ROOT="$pkgdir" install
    install -vDm 644 {AUTHORS,README.md} \
    -t "${pkgdir}/usr/share/doc/${pkgname}"

}
