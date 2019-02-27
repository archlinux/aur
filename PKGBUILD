# Maintainer: goetzc
pkgname=spotifywm-git
pkgver=0.0.r1.91dd553
pkgrel=2
pkgdesc='Makes Spotify more friendly to window managers by settings a class name before opening the window.'
url=https://github.com/dasJ/spotifywm
arch=(i686 x86_64)
license=(MIT)
makedepends=(git)
depends=(libx11 sh)
optdepends=(spotify)
source=('spotifywm::git+https://github.com/dasJ/spotifywm/'
        'spotify.sh')
md5sums=('SKIP'
         '974b9c6d2b6889dce6277c750cce48da')

pkgver() {
  cd spotifywm
  echo "0.0.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd spotifywm
  make
}

package() {
  cd spotifywm

  # Library
  install -D "${srcdir}/spotifywm/spotifywm.so" "${pkgdir}"/usr/lib/spotifywm.so

  # Start script
  install -Dm755 "${srcdir}/spotify.sh" "${pkgdir}/usr/local/bin/spotify"
}
