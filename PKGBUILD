# Maintainer: Solomon Choina <shlomochoina@gmail.com>
pkgname=kawanime-bin
_pkgname=kawanime
pkgver=0.4.2
pkgrel=1
provides=("kawanime")
conflicts=("kawanime")
pkgdesc="Desktop app for anime fans"
arch=('x86_64')
url="https://github.com/Kylart/KawAnime"
license=('MIT')
depends=('glib2' 'dbus')
#dpkg is not actually needed, it's just to avoid a build failure
source=("https://github.com/Kylart/$_pkgname/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
sha256sums=('fc62584e354ccd0e670a3a066f60e61c38e7af10b5fd07c97c1e545f65ee6278')

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
