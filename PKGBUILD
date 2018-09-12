# Maintainer: Solomon Choina <shlomochoina@gmail.com>
pkgname=kawanime-bin
_pkgname=kawanime
pkgver=0.3.1
pkgrel=1
provides=("kawanime")
conflicts=("kawanime")
pkgdesc="Desktop app for anime fans"
arch=('x86_64')
url="https://github.com/Kylart/KawAnime"
license=('MIT')
depends=('nodejs')
#dpkg is not actually needed, it's just to avoid a build failure
source=("https://github.com/Kylart/$_pkgname/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
sha256sums=('d3ca94ea03dfda053711f4a6f46457fd27cbc0a7ff51d0bdaf5dfa49a965c3ba')

package() {
	cd "$srcdir/"
  ar x *.deb
  tar -xf data.tar.xz
  mv usr "${pkgdir}"
  mv opt "${pkgdir}"

  install -Dm755 /dev/stdin "$pkgdir"/usr/bin/$_pkgname <<END
  #!/usr/bin/bash
  /opt/KawAnime/kawanime

END
}
